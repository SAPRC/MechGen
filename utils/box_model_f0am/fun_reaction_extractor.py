import re
import pandas as pd
import numpy as np

class SpeciesExtractor:
    """
    Handles extraction and processing of species from MechGen output files.
    """
    
    @staticmethod
    def extract_species(file_path, string_start, string_end):
        """
        Extracts MechGen species from the MechGen output file.

        Parameters:
            file_path (str): Path to the MechGen output file.
            string_start (str): Starting line of the target species.
            string_end (str): Ending line of the target species.

        Returns:
            df_species (DataFrame): A dataframe of extracted species with columns:
                - Species: Species names
                - MGName: MechGen names
        """
        with open(file_path, 'r') as file:
            lines = file.readlines()

        # Find the start and end indices of the section
        start_index = lines.index(f'{string_start}\n') + 1
        end_index = lines.index(f'{string_end}\n')

        # Extract species
        list_mgname = []
        list_species = []
        for line in lines[start_index:end_index]:
            if not line.split()[0].startswith("!") and not line.split()[0].startswith("."): 
                mgname = line.split('!')[0].split(' ')[0]
                name = line.split('!')[1].split('\n')[0].split(' ')[-1]
                list_mgname.append(mgname)
                list_species.append(name)
     
        # Create and clean DataFrame
        df_species = pd.DataFrame({
            'Species': list_species,
            'MGName': list_mgname,
        })
        
        df_species = df_species.dropna(subset=['Species'])  
        df_species = df_species.drop_duplicates(subset='Species')
          
        return df_species

    @staticmethod
    def build_compounds(input_file, default_compounds):
        """
        Extract species (compounds) from the input file and apply name replacements.

        Parameters:
            input_file (str): Path to input file.
            default_compounds (list): List of default compounds.

        Returns:
            tuple: (compounds_total, compounds_sts) where:
                compounds_total: list of all species names.
                compounds_sts: list of species from the ".STS" file.
        """
        # Extract species from STS and ACT files
        df_sts = SpeciesExtractor.extract_species(input_file, ".STS", ".RXN")
        compounds_sts = df_sts["MGName"].tolist()

        df_act = SpeciesExtractor.extract_species(input_file, ".ACT", ".RXN")
        compounds_act = df_act["MGName"].tolist()

        # Exclude default and STS species from ACT list
        compounds_act = [
            comp for comp in compounds_act
            if comp not in default_compounds and comp not in compounds_sts
        ]

        # Process all compounds
        compounds_total = default_compounds + compounds_act + compounds_sts
        compounds_total = [comp.replace("-", "_") for comp in compounds_total]

        return compounds_total, compounds_sts

    @staticmethod
    def clean_null_compounds(compound_list, reaction_list):
        """
        Filter compounds list to only those appearing in reactions and return dropped compounds.

        Parameters:
            compound_list (list): List of compound names.
            reaction_list (list): List of reaction strings.

        Returns:
            tuple: (filtered_compounds, dropped_compounds) where:
                - filtered_compounds: Compounds present in reactions.
                - dropped_compounds: Compounds NOT found in reactions.
        """
        combined_reactions = " ".join(reaction_list)
        pattern = r'\b(?:' + '|'.join(re.escape(comp) for comp in compound_list) + r')\b'
        found_compounds = set(re.findall(pattern, combined_reactions))
        
        filtered_compounds = [comp for comp in compound_list if comp in found_compounds]
        dropped_compounds = [comp for comp in compound_list if comp not in found_compounds]
        
        return filtered_compounds, dropped_compounds


class ReactionExtractor:
    """
    Handles extraction and processing of reactions from MechGen output files.
    """
    
    @staticmethod
    def parse_reactions(file_path):
        """
        Extract reaction strings from MechGen output file.

        Parameters:
            file_path (str): Path to the MechGen output file.

        Returns:
            list: List of extracted reaction strings.
        """    
        with open(file_path, 'r') as file:
            lines = file.readlines()

        # Find reaction section boundaries
        rxn_start_index = lines.index('.RXN\n') + 1
        try:
            rxn_end_index = lines.index('.\n', rxn_start_index)
        except ValueError:
            rxn_end_index = len(lines)

        reactions = []
        current_reaction = ""

        # Process reaction lines
        for line in lines[rxn_start_index:rxn_end_index]:
            line = line.strip().replace('#', '')
            if line.startswith('R)'):  # New reaction
                if current_reaction:
                    reactions.append(current_reaction)
                current_reaction = line
            else:
                # Continuation line
                current_reaction += ' ' + line

        # Add final reaction
        if current_reaction:
            reactions.append(current_reaction)

        return reactions

    @staticmethod
    def handle_photolysis(value, names_PF):
        """
        Filter the rates for reactions with HV (photolysis products).

        Parameters:
            value (str): Rate value string to process.
            names_PF (list): List to store product names.

        Returns:
            str: Processed rate string.
        """        
        if 'PF=' in value:
            product_match = re.search(r'PF=([^\s]+)', value)
            yield_match = re.search(r'QY=([0-9\.eE\-]+)', value)
            if product_match:
                product_name = product_match.group(1).replace('-', '_')
                if product_name == 'C2CHOabs':
                    product_name = 'C2CHO'
                if product_name not in names_PF:
                    names_PF.append(product_name)
                if yield_match:
                    yield_value = yield_match.group(1)
                    return f"{product_name} * {yield_value}"
                return f"{product_name}"
        return value

    @staticmethod
    def format_rate(rate_str, names_PF):
        """
        Format reaction rate for F0AM input.

        Parameters:
            rate_str (str): Rate string to format.
            names_PF (list): List of photolysis product names.

        Returns:
            str: Formatted rate expression.
        """   
        # Check for photolysis product format
        cleaned_value = ReactionExtractor.handle_photolysis(rate_str, names_PF)
        if cleaned_value != rate_str:
            return f"J{cleaned_value}"

        # Process Arrhenius parameters
        rate_parts = cleaned_value.split()
        R = -0.001987204258640  # Gas constant in kcal/(mol*K)
        TREF = 300  # Reference temperature in K
        
        try:
            if len(rate_parts) == 3:
                A = float(rate_parts[0])
                E = float(rate_parts[1]) / R
                B = rate_parts[2]
                return f"{A} .* exp({E:.4f}./T) .* (T./{TREF}).^{B}"

            elif len(rate_parts) == 2:
                A = float(rate_parts[0])
                E = float(rate_parts[1]) / R
                return f"{A} .* exp({E:.4f}./T)"
                
        except ValueError:
            return rate_str

        return rate_str

    @staticmethod
    def load_ref_rxns(file_path):
        """
        Extract reactions from base mechanism file to avoid duplicates.

        Parameters:
            file_path (str): Path to reference mechanism file.

        Returns:
            set: Set of reactant parts from reference reactions.
        """
        reactant_equations = set()
        with open(file_path, 'r') as file:
            for line in file:
                if line.startswith('Rnames{'):
                    start = line.find("= '") + 3
                    end = line.find("';", start)
                    reaction_eqn = line[start:end].replace('-', '_')
                    reactant_part = reaction_eqn.split('=')[0].strip()
                    reactant_equations.add(reactant_part)
        return reactant_equations

    @staticmethod
    def format_for_f0am(gen, precursor, compounds, reactions, para_soa=False, radical_cutoff=False, reference_reactions=None):
        """
        Format reactions for F0AM input.

        Parameters:
            gen(string): Flag for single or multi generation mech
            precursor(string): Precursor reactant
            compounds(list): List of compounds that is defined
            reactions (list): List of reaction strings to format.
            para_soa (bool): Flag for SOA parameterization.
            radical_cutoff (int/bool): Cutoff for radical generation numbers.
            reference_reactions (set): Set of reactions to exclude (from base mechanism).

        Returns:
            tuple: (formatted_reactions, names_PF) where:
                formatted_reactions: List of MATLAB-formatted reaction strings.
                names_PF: List of photolysis product names.
        """
        formatted_reactions = []
        df_reactions = pd.DataFrame(columns=['Rate','R1','R2', 
                                           'P1','P2','P3','P4','P5',
                                           'P6','P7','P8','P9','P10'])  
        
        # The RO2 species label are different
        radical_start_string = f"{precursor}r" if gen == "Single" else "RAD"
        
        i = 1  # Reaction index counter
        names_PF = []  # Photolysis product names
        
        for reaction in reactions:
            parts = reaction.split(';')
            if len(parts) < 2:
                continue

            # Parse reaction components
            reaction_info = parts[0].strip()
            reaction_eqn = parts[1].strip().replace('-', '_')
            reactant_part = reaction_eqn.split('=')[0].strip()

            # Skip existing reactions
            if reference_reactions is not None and reactant_part in reference_reactions:
                print(f"...Skipping existing reactant: {reactant_part}") 
                continue
            
            # Filter species that not defined
            species_label = reactant_part.split(' ')[0]
            if species_label not in compounds:
                continue

            # Filter radicals by generation number
            if radical_cutoff:
                if reactant_part.startswith(radical_start_string):
                    radical_label = reactant_part.split(' ')[0]
                    radical_number = int(''.join(filter(str.isdigit, radical_label.split('_')[-1])))
                    if radical_number > radical_cutoff:
                        continue
                    
                
            # Format reaction rate
            rate_start = reaction_info.find('R)') + 2
            reaction_rate = reaction_info[rate_start:].strip()
            formatted_rate = ReactionExtractor.format_rate(reaction_rate, names_PF)

            # Split reactants and products
            reactant_part, product_part = reaction_eqn.split('=')
            reactants = [r.strip().replace('-', '_') for r in reactant_part.split('+')]
            product_entries = [p.strip() for p in product_part.split('+')]

            # Build MATLAB reaction components
            reaction_header = f"%   {i}, <R{i:03}>"
            increment_i = "i = i + 1;"
            rnames_line = f"Rnames{{i}} = '{reaction_eqn.replace('-', '_')}';"
            rate_line = f"k(:,i) = {formatted_rate};"
            
            # Reactant strings
            gstr_lines = ''.join(
                f"Gstr{{i,{idx}}} = '{reactant}'; " 
                for idx, reactant in enumerate(reactants, start=1) 
                if reactant != "HV"
            )
            
            # Populate DataFrame
            df_reactions.at[i, 'Rate'] = formatted_rate
            df_reactions.at[i, 'R1'] = reactants[0]  
            if len(reactants) == 2:
                df_reactions.at[i, 'R2'] = reactants[1] 
            for j in range(1, 10):
                df_reactions.at[i, f'P{j}'] = product_entries[j-1] if j <= len(product_entries) else np.nan

            # Build stoichiometry coefficients
            f_lines = []
            # Reactant coefficients
            for reactant in reactants:
                if reactant != "HV":
                    f_lines.append(f"f{reactant}(i) = f{reactant}(i) - 1;")
                    if reactant.startswith(radical_start_string):
                        f_lines.append("fRO2(i) = fRO2(i) - 1;")
            # Product coefficients
            ro2_count = 0
            for entry in product_entries:  
                parts = entry.split()
                yield_value = 1.0
                if len(parts) > 1 and parts[0].replace('.', '', 1).isdigit():
                    yield_value = float(parts[0])
                    product = ' '.join(parts[1:]).replace('-', '_')
                else:
                    product = entry.replace('-', '_')
                    
                if product.strip():
                    if para_soa or not product.startswith('VBS'):
                        f_lines.append(f"f{product}(i) = f{product}(i) + {yield_value};")
                    if product.startswith(radical_start_string):
                        ro2_count += yield_value 
            if ro2_count > 0: 
                f_lines.append(f"fRO2(i) = fRO2(i) + {ro2_count};")

            # Combine components
            formatted_reactions.append(
                f"{reaction_header}\n{increment_i}\n{rnames_line}\n{rate_line}\n{gstr_lines}\n" + '\n'.join(f_lines)
            )
            i += 1
        
        return formatted_reactions, names_PF


class MechanismWriter:
    """
    Handles writing the processed mechanism to output files.
    """
    
    @staticmethod
    def write_mech(file_handle, compounds_list, reaction_list,
                                  name_replacements, target_reactant, target_minyld):
        """
        Write mechanism to output file in F0AM format.

        Parameters:
            file_handle (file): Open file handle for writing.
            compounds_list (list): List of all compounds.
            reaction_list (list): Formatted reaction strings.
            name_replacements (dict): Dictionary for name replacements.
            target_reactant (str): Target reactant name.
            target_minyld (float): Minimum yield threshold.
        """
        NUMBER_COMPOUND = 6

        # Write header
        file_handle.write(f"% MechGen derived {target_reactant} explicit mechanism\n")
        file_handle.write(f"% Default mechanism with MinYld={target_minyld}\n")

        # Write species block
        compounds_list = [name_replacements.get(compound, compound) for compound in compounds_list]
        file_handle.write("SpeciesToAdd = {...\n")
        for i in range(0, len(compounds_list), NUMBER_COMPOUND):
            line_compounds = compounds_list[i:i + NUMBER_COMPOUND]
            line_text = "; ".join(f"'{comp}'" for comp in line_compounds)
            if i + NUMBER_COMPOUND >= len(compounds_list):
                file_handle.write(line_text + ";};\n")
            else:
                file_handle.write(line_text + ";...\n")
        file_handle.write("\nAddSpecies\n\n")

        # Write reactions
        file_handle.write("% Reactions:\n")
        for reaction in reaction_list:
            for old, new in name_replacements.items():
                reaction = reaction.replace(old, new)
            file_handle.write(reaction + "\n\n")
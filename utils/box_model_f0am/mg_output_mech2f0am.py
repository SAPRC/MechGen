#!/usr/bin/env python3
"""
Script to convert MechGen output reactions to F0AM format.

Note:
    MATLAB variable names cannot start with a number. 
    For example, "2M2C5E4O" is renamed to "TM2C5E4O".
"""

import logging
from fun_reaction_extractor import SpeciesExtractor, ReactionExtractor, MechanismWriter


def main():
    
    ###########################################################################
    #                      Configuration                                      #
    ###########################################################################
    
    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s - %(levelname)s - %(message)s"
    )
    
    logging.info("Starting MechGen to F0AM conversion process")
    
    # Configuration your input/output data directory 
    TARGET_REACTANT = "ISOPRENE"
    TARGET_GEN = "Multi"
    TARGET_MINYLD = "0.001"
    ref_path = "MechGen_Base.m"
    input_path = f"MG-{TARGET_REACTANT}_Rxnfile_{TARGET_MINYLD}.dat"
    output_path = f"MechGen_{TARGET_REACTANT}.m"
    
    
    # Define species name replacements (to satisfy MATLAB naming conventions)
    NAME_REPLACEMENTS = {
        "RO2": "SumRO2",
        "RCO3": "SumRCO3",
        "SumSum": "Sum",
        "2M2C5E4O": "TM2C5E4O",
        "4OX2PEAL": "FOX2PEAL",
        "3M_FURAN": "M3FURAN",
        "2MBUTDAL": "M2BUTDAL"
    }
    
    logging.info(f"Configuration loaded - Target: {TARGET_REACTANT}")
    

    
    ###########################################################################
    #                        Load Ref Reactions                               #
    ###########################################################################
    # SAPRC22 base mechanism
    logging.info("Reading reference reactions...")
    reference_reactions = ReactionExtractor.load_ref_rxns(ref_path)

    # Default species list
    DEFAULT_COMPOUNDS = [
        "RO2", "RCO3",  # Counter species
        "LostMoles", "LostMass",
        "NegC", "NegH", "NegN", "NegO",
        "GLYOXAL", "FORMACID",
    ]
    
    ###########################################################################
    #                         Parse Compounds                                 #
    ########################################################################### 
    
    logging.info("Creating compounds list...")
    compounds_total, compounds_sts = SpeciesExtractor.build_compounds(    
        input_path,    
        DEFAULT_COMPOUNDS,
    )
    
    ###########################################################################
    #                           Parse Reactions                               #
    ########################################################################### 
    
    logging.info("Parsing reaction equations...")
    reactions = ReactionExtractor.parse_reactions(input_path)
    logging.info(f"...Found {len(reactions)} raw reactions")
    
    logging.info("...Converting reactions to F0AM format")
    formatted_reactions, names_pf = ReactionExtractor.format_for_f0am(
        TARGET_GEN,
        TARGET_REACTANT,
        compounds_total,
        reactions,
        #radical_cutoff=2000, # 4756
        reference_reactions=reference_reactions
    )
    
    ###########################################################################
    #                         Clean Compounds                                 #
    ########################################################################### 

    # Need to filtered out the compounds not appear in the reactions
    logging.info("...Cleaning null compounds")
    [compounds_cleaned, compounds_dropped] = SpeciesExtractor.clean_null_compounds(compounds_total, formatted_reactions)
    
    logging.info(f"...Initial compounds count: {len(compounds_total)}")
    logging.info(f"...Compounds after cleaning: {len(compounds_cleaned)} (removed {len(compounds_dropped)})")
                
    
    ###########################################################################
    #                       Build F0AM-Ready File                             #
    ########################################################################### 
    
    logging.info("Writing mechanism to output...")
    with open(output_path, "w") as f:
        MechanismWriter.write_mech(
            f,
            compounds_cleaned,
            formatted_reactions,
            NAME_REPLACEMENTS,
            TARGET_REACTANT,
            TARGET_MINYLD
        )
    logging.info("Mechanism file successfully written")


if __name__ == "__main__":
    main()
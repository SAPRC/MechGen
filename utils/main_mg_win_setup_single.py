#!/usr/bin/env python3
"""
Script for configuring MechGen and generating a single-generation mechanism.
Created by Jia Jiang, 2024/10/5
"""

import time
import os
import logging
from pywinauto.application import Application
from typing import Dict, List, Any

# Configure logging to include time and log level
logging.basicConfig(level=logging.INFO,
                    format='%(asctime)s - %(levelname)s - %(message)s')


def escape_smiles(smiles: str) -> str:
    """
    Escape parentheses in the SMILES string so that pywinauto's
    key parser interprets them as literal characters.
    
    Args:
        smiles: A SMILES string.
    
    Returns:
        A new SMILES string with escaped parentheses.
    """
    return smiles.replace("(", "{(}").replace(")", "{)}")


def connect_to_account(host: str, port: int, username: str, password: str, timewait: int) -> Any:
    """
    Launch PuTTY in Telnet mode and connect to the account.
    
    Args:
        host: Host IP address.
        port: Port number.
        username: Account username.
        password: Account password.
        timewait: Time to wait between keystrokes.
    
    Returns:
        A pywinauto window handle representing the PuTTY session.
    """
    app = Application().start(f'putty -telnet {host} -P {port}')
    putty = app.PuTTY
    putty.wait('ready')
    
    # Send a dummy command since the first command always fails.
    putty.type_keys("connect {ENTER}")
    time.sleep(timewait)
    
    # Connect to the account.
    putty.type_keys(f"connect {username} {password} {{ENTER}}", with_spaces=True)
    time.sleep(timewait)
    
    logging.info("...Finished")
    return putty


def configure_environment(putty: Any, options: Dict[str, Any], timewait: int) -> None:
    """
    Configures the environmental conditions.
    
    Args:
        putty: The PuTTY window handle.
        options: A dictionary of environmental options.
        timewait: Time in seconds to wait after each command.
    """
    putty.type_keys("Reset-options {ENTER}", with_spaces=True)
    
    for option, value in options.items():
        command = f"option {option} is {value} {{ENTER}}"
        logging.info(f"...Option {option} is {value}")
        putty.type_keys(command, with_spaces=True)
        time.sleep(timewait)
        
    logging.info("......Finished")
    

def build_compound_list(putty: Any, mix_container: str, compounds: Dict[str, str], timewait: int) -> None:
    """
    Builds the container and adds the list of compounds.
    
    For each compound:
        - Build from its SMILES string (with escape applied).
        - Rename using the user-defined name.
        - Place the compound in the container.
    
    Args:
        putty: The PuTTY window handle.
        mix_container: The name of the container.
        compounds: Dictionary mapping compound names to SMILES strings.
        timewait: Time in seconds to wait after each command.
    """
    logging.info("...Creating container or clearing existing reactants.")
    putty.type_keys(f"Create-container {mix_container} {{ENTER}}", with_spaces=True)
    putty.type_keys(f"Zap-reactants in {mix_container} {{ENTER}}", with_spaces=True)
    time.sleep(timewait)
    
    for compound, smiles in compounds.items():
        safe_smiles = escape_smiles(smiles)
        logging.info(f"...Building {compound}: {smiles}")
        
        putty.type_keys(f"Build {safe_smiles} {{ENTER}}", with_spaces=True)
        time.sleep(timewait)        
        putty.type_keys(f"Build {compound} as {safe_smiles} {{ENTER}}", with_spaces=True)
        time.sleep(timewait)        
        putty.type_keys(f"Put {compound} in {mix_container} {{ENTER}}", with_spaces=True)
        time.sleep(timewait)
    
    putty.type_keys(f"Look {mix_container} {{ENTER}}", with_spaces=True)
    time.sleep(timewait)
    
    logging.info("...Finished")


def react_compounds(putty: Any, mix_container: str, timewait: int) -> None:
    """
    Initiates full reactions on the compounds in the specified container.
    
    Args:
        putty: The PuTTY window handle.
        mix_container: The name of the container.
        timewait: Time in seconds to wait after each command.
    """
    logging.info(f"...Initiating full reaction in container {mix_container}")
    logging.info("...Wait!!! Processing mechanism takes a significant amount of time")
    
    putty.type_keys(f"fullreact in {mix_container} {{ENTER}}", with_spaces=True)
    putty.type_keys(f"Look {mix_container} {{ENTER}}", with_spaces=True)
    
    
def wait_for_file(file_path: str, wait_interval: int = 60, max_wait: int = 600) -> None:
    """
    Wait until the specified file exists, with a maximum timeout.
    
    Args:
        file_path: Path to the file to wait for.
        wait_interval: Seconds between each check.
        max_wait: Maximum seconds to wait before timing out.
    
    Raises:
        TimeoutError: If the file is not found within the max_wait time.
    """
    waited = 0
    while not os.path.exists(file_path):
        time.sleep(wait_interval)
        waited += wait_interval
        logging.info(f"......{waited/60} min")
        if waited >= max_wait:
            raise TimeoutError("......Timeout waiting")


def output_mixture_files(putty: Any, mix_container: str, output_types: List[str], output_dir: str, timewait: int) -> None:
    """
    Outputs files for the entire mixture in the container.
    
    Args:
        putty: The PuTTY window handle.
        mix_container: The container name.
        output_types: List of output types to generate.
        output_dir: Directory where output files are saved.
        timewait: Time in seconds to wait after each command.
    """
    putty.type_keys(f"Fill {mix_container} {{ENTER}}", with_spaces=True)
    
    for file_type in output_types:
        if file_type in ["List", "Summary", "Cmpdinfo", "Products", "Rxns", "Reactions"]:
            logging.info(f"...Processing file output: {file_type}")
            
            file_old = os.path.join(output_dir, f"{mix_container}.rxn") if file_type == "Rxns" \
                       else os.path.join(output_dir, "mechmoo.dat")
            file_new = os.path.join(output_dir, f"{mix_container}_{file_type}.dat")
            
            putty.type_keys(f"fileout {file_type} in {mix_container} {{ENTER}}", with_spaces=True)
            wait_for_file(file_old)
            
            if os.path.exists(file_new):
                os.remove(file_new)
            os.rename(file_old, file_new)
            
    logging.info("...Finished")


def output_single_compound_files(putty: Any, compounds: Dict[str, str], mix_container: str, output_types: List[str], output_dir: str, timewait: int) -> None:
    """
    Outputs files for each individual compound in the container.
    
    Args:
        putty: The PuTTY window handle.
        compounds: Dictionary mapping compound names to SMILES strings.
        mix_container: The container name.
        output_types: List of output types to generate.
        output_dir: Directory where output files are saved.
        timewait: Time in seconds to wait after each command.
    """
    putty.type_keys(f"Empty {mix_container} {{ENTER}}", with_spaces=True)
    
    for compound in compounds:
        for file_type in output_types:
            if file_type in ["Products", "Rxns", "Reactions", "Prodinfo", "Processed", "Tabreactions", "Tabrxns"]:
                logging.info(f"...Processing output for compound '{compound}' with '{file_type}'")
                
                file_old = os.path.join(output_dir, "mechmoo.dat")
                file_new = os.path.join(output_dir, f"{compound}_{file_type}.dat")
                
                putty.type_keys(f"fileout {file_type} on {compound} {{ENTER}}", with_spaces=True)
                time.sleep(timewait)
                wait_for_file(file_old)
                
                if os.path.exists(file_new):
                    os.remove(file_new)
                os.rename(file_old, file_new)
    
    logging.info("...Finished")



def main() -> None:
    # Login information
    HOST = "your_host"  # Updated host address
    PORT = "your_port"
    USERNAME = "your_username"
    PASSWORD = "your_password"
    TIMEWAIT = 2

    # Environmental options (set OPTION_ON to True to enable)
    OPTION_ON = True
    OPTION_LIST = {
        "MinYld": 0.005,    # Default 0.005
        "T": 298,           # Default 298 K
        "PM": 50,           # Default 50 ug/m3
        "H2O": "present",   # Default "absent"
    }

    # Operation switches
    BUILD_ON = False     # Build compounds
    REACT_ON = False     # React the compounds
    OUTPUT_ON = False    # Output files
    OUTMIX_ON = False    # Output as mixture (True) or single compound files (False)

    # Compound container and list
    MIX_CONTAINER = "MIXTEST"
    DICT_COMPOUNDS = {
        "APINENE": "CC1=CCC2CC1C2(C)C",
        # "PINAL": "CC1(C2CCC1C(=O)C=C2)O",
    }
    
    # Output settings
    OUTPUT_DIR = rf"D:\MECHGEN\files\Users\{USERNAME}"
    OUTPUT_TYPES = [
        "List", "Summary", "Cmpdinfo",                       # Only for mixture outputs
        "Products", "Reactions", "Rxns",                     # For all types
        "Processed", "Prodinfo", "Tabreactions", "Tabrxns",  # Only for single species outputs
    ]
    
    try:
        logging.info("Connecting to account...")
        putty = connect_to_account(HOST, PORT, USERNAME, PASSWORD, TIMEWAIT)
        
        if OPTION_ON:
            logging.info("Configuring environmental conditions...")
            configure_environment(putty, OPTION_LIST, TIMEWAIT)
        
        if BUILD_ON:
            logging.info("Building compound list...")
            build_compound_list(putty, MIX_CONTAINER, DICT_COMPOUNDS, TIMEWAIT)
        
        if REACT_ON:
            logging.info("Reacting compounds...")
            react_compounds(putty, MIX_CONTAINER, TIMEWAIT)
        
        if OUTPUT_ON:
            if os.path.exists(OUTPUT_DIR):
                logging.info("Outputting files...")
                if OUTMIX_ON:
                    output_mixture_files(putty, MIX_CONTAINER, OUTPUT_TYPES, OUTPUT_DIR, TIMEWAIT)
                else:
                    output_single_compound_files(putty, DICT_COMPOUNDS, MIX_CONTAINER, OUTPUT_TYPES, OUTPUT_DIR, TIMEWAIT)
            else:
               logging.info("Output directory does not exist...") 
                
    except Exception as e:
        logging.error(f"An error occurred: {e}")


if __name__ == "__main__":
    main()

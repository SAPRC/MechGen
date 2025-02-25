#!/usr/bin/env python3
"""
Script for configuring MechGen-Windows and generating a multi-generation mechanism.
Created by Jia Jiang, 2024/12/8
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


def configure_environment(putty: Any, options: Dict[str, any], timewait: int) -> None:
    """
    Configures the environmental conditions for a single-generation mechanism.
    
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
    logging.info("...Finished")


def build_compound_single(putty: Any, compound: str, smiles: str, timewait: int) -> None:
    """
    Build and rename the target compound for multi-generation.
    
    Args:
        putty: The PuTTY window handle.
        compound: The user-defined name for the compound.
        smiles: The SMILES string for the compound.
        timewait: Time in seconds to wait after each command.
    """
    safe_smiles = escape_smiles(smiles)
    logging.info(f"...Building compound '{compound}' with SMILES: {smiles}")
    putty.type_keys(f"Build {safe_smiles} {{ENTER}}", with_spaces=True)
    time.sleep(timewait)
    putty.type_keys(f"Build {compound} as {safe_smiles} {{ENTER}}", with_spaces=True)
    time.sleep(timewait)
    
    logging.info("...Finished")


def configure_multi_generation(putty: Any, compound: str, multi_options: Dict[str, any], timewait: int) -> None:
    """
    Enable multi-generation mechanism for the specified compound.
    
    Args:
        putty: The PuTTY window handle.
        compound: The compound name.
        multi_options: Dictionary including multi-generation options like:
            - "MinYld": Minimum yield value.
            - "RxnHours": Reaction time in hours.
        timewait: Time in seconds to wait after each command.
    """
    putty.type_keys(f"Create-MGmech {compound} {{ENTER}}", with_spaces=True)
    
    for option, value in multi_options.items():
        command = f"{option} MG-{compound} is {value} {{ENTER}}"
        logging.info(f"...{option} MG-{compound} is {value}")
        putty.type_keys(command, with_spaces=True)
    time.sleep(timewait)
    
    logging.info("...Finished")


def react_compound(putty: Any, compound: str, timewait: int) -> None:
    """
    Initiate reactions for multi-generation mechanism on the given compound.
    
    Args:
        putty: The PuTTY window handle.
        compound: The compound name.
        timewait: Time in seconds to wait after each command.
    """
    logging.info("...Wait!!! Processing mechanism takes a significant amount of time")
    putty.type_keys(f"Reset MG-{compound} {{ENTER}}", with_spaces=True)
    putty.type_keys(f"Allreact MG-{compound} {{ENTER}}", with_spaces=True)



def wait_for_file(file_path: str, wait_interval: int = 60, max_wait: int = 3600) -> None:
    """
    Wait until the specified file is created, with a maximum timeout.
    
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


def output_multi_gen_files(putty: Any, compound: str, output_types: List[str], output_dir: str, timewait: int) -> None:
    """
    Output files for the multi-generation mechanism.
    
    Each file type is processed and the output is renamed accordingly.
    
    Args:
        putty: The PuTTY window handle.
        compound: The compound name.
        output_types: List of output types to generate.
        output_dir: Directory where output files are saved.
        timewait: Time in seconds to wait after each command.
    """
    for file_type in output_types:
        logging.info(f"...Processing file output for {file_type}")
        
        file_old = os.path.join(output_dir, "mechmoo.dat")
        if file_type == "List":
            putty.type_keys(f"fileout MG-{compound} {{ENTER}}", with_spaces=True)
        elif file_type in ["Summary", "Cmpdinfo", "Products", "Formedby"]:
            putty.type_keys(f"fileout {file_type} on MG-{compound} {{ENTER}}", with_spaces=True)
        elif file_type in ["Rxns", "Rxnfile"]:
            putty.type_keys(f"fileout {file_type} on MG-{compound} {{ENTER}}", with_spaces=True)
            file_old = os.path.join(output_dir, f"MG-{compound}.rxn")
        
        file_new = os.path.join(output_dir, f"{compound}_{file_type}.dat")
        wait_for_file(file_old)
        
        if os.path.exists(file_new):
            os.remove(file_new)
        os.rename(file_old, file_new)
        time.sleep(timewait)
        
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
    
    # Environmental options for multi-generation
    OPTION_MULTI_ON = True
    OPTION_MULTI_LIST = {
        "MinYld": 0.05,     # Default 0.0001, between 0~0.5
        "RxnHours": 6,      # Default 6
    }

    # Operation switches
    BUILD_MULTI_ON  = False    # Build compound?
    REACT_MULTI_ON  = False    # React the compound?
    OUTPUT_MULTI_ON = False    # Output files?

    # Compound to process (for multi-generation, one compound at a time)
    DICT_COMPOUNDS: Dict[str, str] = {
        "ISOPRENE": "CC(=C)C=C",
    }

    # Output settings
    OUTPUT_DIR = rf"D:\MECHGEN\files\Users\{USERNAME}"
    OUTPUT_TYPES: List[str] = [
        "List","Cmpdinfo", "Summary", "Formedby",
        "Rxnfile", "Products",  
    ]
    
    try:
        logging.info("Connecting to your account...")
        putty = connect_to_account(HOST, PORT, USERNAME, PASSWORD, TIMEWAIT)
        
        if OPTION_ON:
            logging.info("Configuring environmental conditions for single-generation...")
            configure_environment(putty, OPTION_LIST, TIMEWAIT)
        
        if BUILD_MULTI_ON:
            compound, smiles = list(DICT_COMPOUNDS.items())[0]
            logging.info(f"Building target compound '{compound}'")
            build_compound_single(putty, compound, smiles, TIMEWAIT)
        
        if OPTION_MULTI_ON:
            compound, _ = list(DICT_COMPOUNDS.items())[0]
            logging.info(f"Enabling multi-generation mechanism for '{compound}'")
            configure_multi_generation(putty, compound, OPTION_MULTI_LIST, TIMEWAIT)
        
        if REACT_MULTI_ON:
            compound, _ = list(DICT_COMPOUNDS.items())[0]
            logging.info(f"Initiating reactions for multi-generation on '{compound}'")
            react_compound(putty, compound, TIMEWAIT)
        
        if OUTPUT_MULTI_ON:
            if os.path.exists(OUTPUT_DIR):
                compound, _ = list(DICT_COMPOUNDS.items())[0]
                logging.info(f"Outputting multi-generation files for '{compound}'")
                output_multi_gen_files(putty, compound, OUTPUT_TYPES, OUTPUT_DIR, TIMEWAIT)
            else:
               logging.info("Output directory does not exist...") 
            
    except Exception as e:
        logging.error(f"An error occurred: {e}")


if __name__ == "__main__":
    main()

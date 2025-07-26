#!/bin/bash

###############################################################################
# install_moo.sh
#
# Install and build the LambdaMOO server (with FUP) for running the 
# MechGen database on Unix/Linux.
#
# Sources:
#   LambdaMOO: https://sourceforge.net/projects/lambdamoo/
#   FUP:       https://www.moo-cows.com/ftp/ext-FUP-1.8.tgz
#
# Updated: 2025/07/25
# More info: https://github.com/SAPRC/MechGen/wiki
###############################################################################

set -e

MOO_DIR="./MOO-1.8.1_wFUP"
TAR_FILE="LambdaMOO-1.8.1_wFUP.tar.gz"

# --- Update FUP options file ---
ROOT_DIR="$(pwd)"
FUP_OPTION_FILE="$MOO_DIR/ext-FUP_options.h"
FUP_DIR="${ROOT_DIR}/files/"

# --- Check telnet availability ---
if ! command -v telnet &> /dev/null; then
    echo "Error: telnet not installed. Please install telnet before installing LambdaMOO."
    exit 1
fi

# --- Check and extract LambdaMOO source if needed ---
if [[ ! -d "$MOO_DIR" ]]; then
    echo "MOO folder $MOO_DIR not found."
    if [[ -f "$TAR_FILE" ]]; then
        echo "Found $TAR_FILE, extracting..."
        tar -xvzf "$TAR_FILE"
    else
        echo "Error: Neither $MOO_DIR nor $TAR_FILE found."
        exit 1
    fi
fi

if [[ ! -d "$MOO_DIR" ]]; then
    echo "Error: $MOO_DIR still not found after extraction."
    exit 1
fi

# --- Update FUP options file and create Users directory ---
if [[ -f "$FUP_OPTION_FILE" ]]; then
    echo "Updating EXTERN_FILES_DIR in $FUP_OPTION_FILE..."
    sed -i "s|\"files/\"|\"${FUP_DIR}\"|g" "$FUP_OPTION_FILE"
    mkdir -p "${FUP_DIR}Users"
else
    echo "Warning: FUP options file not found in extracted directory."
fi

# --- Configure and compile LambdaMOO ---
cd "$MOO_DIR"
sh configure
make clean
make

if [[ ! -x "./moo" ]]; then
    echo "Error: moo executable not found after build."
    exit 1
fi
ln -sf "${MOO_DIR}/moo" "${ROOT_DIR}/moo"

echo
echo "LambdaMOO built successfully."

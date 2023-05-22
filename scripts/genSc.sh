#!/bin/bash

# Prompt the user for the circuit file name
# read -p "Enter the circuit file name (e.g., circuit): " circuit_file
circuit_file=$1


# Set the directory path
circuit_name=$(basename "$circuit_file" | cut -d. -f1)

directory_path="./circuits/${circuit_name}/${circuit_name}_js/"


# Change to the specified directory
cd "$directory_path"

snarkjs zkey export solidityverifier ${circuit_name}_0001.zkey verifier_${circuit_name}.sol


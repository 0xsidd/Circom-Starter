#!/bin/bash

# Prompt the user for the circuit file name
# read -p "Enter the circuit file name (e.g., circuit): " circuit_file
circuit_file=$1

# Set the other file names
circuit_name=$(basename "$circuit_file" | cut -d. -f1)

# Set the directory path
circuits_directory="./circuits/${circuit_name}"
directory_path="${circuits_directory}/${circuit_name}_js/"

# Run the Circom compiler
# circom $circuits_directory/${circuit_file}.circom --r1cs --wasm --sym -o ./circuits


# Change to the specified directory
cd "$directory_path"

# Execute the command
node generate_witness.js ${circuit_name}.wasm ../${circuit_name}_input.json witness.wtns
snarkjs groth16 prove ${circuit_name}_0001.zkey witness.wtns proof.json public.json
snarkjs groth16 verify verification_key.json public.json proof.json
echo "----------------------------------------------------------params start-----------------------------------------------------------------------"
snarkjs generatecall
echo "----------------------------------------------------------params end-------------------------------------------------------------------------"











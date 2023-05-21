#!/bin/bash

# Prompt the user for the circuit file name
read -p "Enter the circuit file name (e.g., circuit): " circuit_file

# Set the other file names
wasm_file="${circuit_file}.wasm"
output_file="witness.wtns"

# Set the command parameters
curve="bn128"
depth="12"
output_file="pot12_0000.ptau"

# Set the directory path
circuits_directory="./circuits"
directory_path="${circuits_directory}/${circuit_file}_js"

# Run the Circom compiler
# circom $circuits_directory/${circuit_file}.circom --r1cs --wasm --sym -o ./circuits


# Change to the specified directory
cd "$directory_path"

# Execute the command
node generate_witness.js ${circuit_file}.wasm ../input.json witness.wtns
snarkjs groth16 prove ${circuit_file}_0001.zkey witness.wtns proof.json public.json
snarkjs groth16 verify verification_key.json public.json proof.json
echo "----------------------------------------------------------params start-----------------------------------------------------------------------"
snarkjs generatecall
echo "----------------------------------------------------------params end-------------------------------------------------------------------------"











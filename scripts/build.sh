#!/bin/bash

# Prompt the user for the circuit file name
# read -p "Enter the circuit file name (e.g., circuit): " circuit_file
circuit_file=$1

# Set the other file names
wasm_file="${circuit_file}.wasm"
output_file="witness.wtns"

# Set the command parameters
curve="bn128"
depth="12"
output_file="pot12_0000.ptau"
circuit_name=$(basename "$circuit_file" | cut -d. -f1)

# Set the directory path
circuits_directory="./circuits"
directory_path="${circuit_file}_js"

# Run the Circom compiler
circom ${circuit_file}.circom --r1cs --wasm --sym -o ./circuits


# Change to the specified directory
cd "$directory_path"

# Execute the command
node generate_witness.js ${circuit_name}.wasm ../input.json witness.wtns
snarkjs powersoftau new "$curve" "$depth" "$output_file" -v
snarkjs powersoftau contribute ${output_file} pot12_0001.ptau --name="First contribution" -v
snarkjs powersoftau prepare phase2 pot12_0001.ptau pot12_final.ptau -v
snarkjs groth16 setup ../${circuit_name}.r1cs pot12_final.ptau ${circuit_name}_0000.zkey
snarkjs zkey contribute ${circuit_name}_0000.zkey ${circuit_name}_0001.zkey --name="1st Contributor Name" -v
snarkjs zkey export verificationkey ${circuit_name}_0001.zkey verification_key.json
snarkjs groth16 prove ${circuit_name}_0001.zkey witness.wtns proof.json public.json
snarkjs groth16 verify verification_key.json public.json proof.json










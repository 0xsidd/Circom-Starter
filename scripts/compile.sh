#!/bin/bash

# Prompt the user for the circuit file name
read -p "Enter the circuit file name (e.g., circuit.circom): " circuit_file

# Set the other file names
circuits_directory="./circuits"
input_file="circuits/input.json"

# Run the Circom compiler
circom $circuits_directory/${circuit_file}.circom

# Create the input.json file
echo "{}" > $input_file
#!/bin/bash

# Prompt the user for the circuit file name
# read -p "Enter the circuit file name (e.g., circuit.circom): " circuit_file
circuit_file=$1

# Set the other file names
# circuits_directory="./circuits"
input_file="circuits/input.json"

# Run the Circom compiler
circom ${circuit_file}.circom

# Create the input.json file
echo "{}" > $input_file
#!/bin/bash

# Prompt the user for the circuit file name
read -p "Enter the circuit file name (e.g., circuit): " circuit_file

# Set the directory path
directory_path="./circuits/${circuit_file}_js/"

# Change to the specified directory
cd "$directory_path"

snarkjs generatecall



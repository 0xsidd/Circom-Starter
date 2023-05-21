#!/bin/bash


# Prompt the user for the circuit file name
# read -p "Enter the circuit file name (e.g., circuit): " circuit_file
circuit_file=$1


# Set the circuits directory path
circuits_directory="circuits/"
folder_path="${circuit_file}_js/"

# Specify the destination directory for the input.json file
destination_directory="./circuits"



# Delete every .js file in the circuits directory
find "$circuits_directory" -type f -name "*.r1cs" -delete
find "$circuits_directory" -type f -name "*.sym" -delete
rm -rf "$folder_path"
# find "$circuits_internal_directory" -type f -name "*.wasm" -delete


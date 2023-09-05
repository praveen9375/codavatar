#!/bin/bash

# Provide the filename as an argument to the script
filename="$1"

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "File not found: $filename"
    exit 1
fi

# Read and process each line of the file
while IFS= read -r line; do
    echo "Line: $line"
done < "$filename"

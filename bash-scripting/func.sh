#!/bin/bash

# Function to read and print file content
read_and_print_file() {
    local filename="$1"

    # Check if the file exists
    if [ ! -f "$filename" ]; then
        echo "File not found: $filename"
        return 1
    fi

    # Check if the file size is less than 5 MB
    local file_size=$(stat -c%s "$filename")
    local max_size=$((5 * 1024 * 1024))  # 5 MB in bytes

    if [ "$file_size" -gt "$max_size" ]; then
        echo "File size exceeds 5 MB: $filename"
        return 1
    fi

    # Print the content of the file
    echo "Content of $filename:"
    cat "$filename"
}

# Main part of the script
echo "Enter the filename:"
read input_filename

# Call the function to read and print the file
read_and_print_file "$input_filename"


#!/bin/bash

# Global variable
global_var="This is a global variable"

# Function to check if the file is valid and less than 5 MB
check_file() {
    local file="$1"  # Local variable
    
    if [ -f "$file" ]; then
        size=$(stat -c %s "$file")
        if [ "$size" -lt 5000000 ]; then
            return 0  # File is valid and size is less than 5 MB
        else
            return 1  # File size is too large
        fi
    else
        return 2  # File doesn't exist
    fi
}

# Function to get user input and print file content
get_file_content() {
    read -p "Enter the file name: " filename
    check_file "$filename"
    case $? in
        0)
            echo "File is valid and less than 5 MB."
            echo "Content of the file:"
            cat "$filename"
            ;;
        1)
            echo "File size is too large (greater than 5 MB)."
            ;;
        2)
            echo "File doesn't exist."
            ;;
    esac
}

# Call the function to get user input and print file content
get_file_content
echo "Global variable: $global_var"


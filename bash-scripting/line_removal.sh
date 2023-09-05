#!/bin/bash

# Function to display file contents and remove lines interactively
view_and_remove_lines() {
    local filename="$1"
    local tmpfile=".tempfile"

    # Check if the file exists
    if [ ! -e "$filename" ]; then
        echo "File not found: $filename"
        exit 1
    fi

    # Display file contents with line numbers
    cat -n "$filename"

    while true; do
        read -p "Enter line number(s) to remove (e.g., 2 or 2-4) or 'q' to quit: " input

        if [ "$input" == "q" ]; then
            break
        fi

        if [[ "$input" =~ ^[0-9,-]+$ ]]; then
            # Process comma-separated and range inputs
            line_numbers=$(echo "$input" | tr ',' ' ')
            sed -i.bak "${line_numbers// /d;}" "$filename"
            echo "Line(s) $input removed."
            sleep 2  # Add a sleep interval between deletions
            clear
            cat -n "$filename"
        else
            echo "Invalid input. Enter line number(s) or 'q' to quit."
        fi
    done

    rm "$filename.bak"  # Remove the backup file created by sed
}

# Main script
if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

view_and_remove_lines "$1"


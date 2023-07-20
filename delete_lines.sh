#!/bin/bash

# Check if the required arguments are provided
if [ $# -lt 2 ]; then
    echo "Usage: $0 <word> <file1> [<file2> ...]"
    exit 1
fi

word=$1
shift

# Iterate through each file
for file in "$@"; do
    # Check if the file exists and is readable
    if [ ! -f "$file" ] || [ ! -r "$file" ]; then
        echo "Error: $file is not a readable file."
        continue
    fi
    
    # Create a temporary file to store the filtered content
    temp_file=$(mktemp)
    
    # Delete lines containing the specified word and store the result in the temporary file
    grep -v "$word" "$file" > "$temp_file"
    
    # Replace the original file with the temporary file
    mv "$temp_file" "$file"
    
    echo "Deleted lines containing '$word' from $file."
done

#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage: $0 <word> <file1> [<file2> ...]"
    exit 1
fi

word=$1
shift


for file in "$@"; do
    
    if [ ! -f "$file" ] || [ ! -r "$file" ]; then
        echo "Error: $file is not a readable file."
        continue
    fi
    
    temp_file=$(mktemp)
    
    grep -v "$word" "$file" > "$temp_file"
    
    mv "$temp_file" "$file"
    
    echo "Deleted lines containing '$word' from $file."
done

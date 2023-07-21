#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage: $0 <word> <file1> [<file2> ...]"
    exit 1
fi

word=$1
shift

for file in "$@"; do
    if [ ! -f "$file" ]; then
        echo "Error: $file does not exist or is not a regular file."
        continue
    fi
    
    if [ ! -r "$file" ]; then
        echo "Error: $file is not readable."
        continue
    fi
    
    if [[ "$word" =~ [^[:alnum:]_\-] ]]; then
        echo "Error: The search word contains invalid characters."
        continue
    fi
    
    temp_file=$(mktemp)
    
    grep -v "\<$word\>" "$file" >"$temp_file"
    grep_exit_code=$?
    
    if [ $grep_exit_code -eq 2 ]; then
        echo "Error: Invalid option passed to grep."
        rm "$temp_file"
        continue
    fi
    
    if [ $grep_exit_code -ne 0 ] && [ $grep_exit_code -ne 1 ]; then
        echo "Error: An unexpected error occurred during grep."
        rm "$temp_file"
        continue
    fi
    
    mv "$temp_file" "$file"
    
    if [ $grep_exit_code -eq 0 ]; then
        echo "Deleted lines containing '$word' from $file."
    else
        echo "No lines containing '$word' found in $file."
    fi
done

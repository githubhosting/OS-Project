#!/bin/bash

if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <word_to_delete> <file1> [file2] [file3] ..."
    exit 1
fi

word_to_delete="$1"
shift

for file in "$@"; do
    if [ -f "$file" ]; then
        sed -i "/\b$word_to_delete\b/d" "$file"
        echo "Deleted lines containing '$word_to_delete' from $file."
    else
        echo "Error: $file is not a valid file."
    fi
done

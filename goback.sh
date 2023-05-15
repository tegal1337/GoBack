#!/bin/bash

keybackdoor="lib/keybackdoor.txt"
folder="/"
output="output/$(date +%Y-%m-%d)/possiblebackdoor.txt"

# Parse command-line arguments
while [[ $# -gt 1 ]]; do
    key="$1"

    case $key in
        -kb|--keybackdoor)
        keybackdoor="$2"
        shift
        ;;
        -fo|--folder)
        folder="$2"
        shift
        ;;
        -o|--output)
        output="$2"
        shift
        ;;
        *)
        ;;
    esac
    shift
done

# Set default key backdoor file if not provided
if [ -z "$keybackdoor" ]; then
    keybackdoor="lib/keybackdoor.txt"
fi

# Set default folder if not provided
if [ -z "$folder" ]; then
    folder="/"
fi

# Set default output file if not provided
if [ -z "$output" ]; then
    output="output/$(date +%Y-%m-%d)/possiblebackdoor.txt"
fi

# Check if key backdoor file exists
if [ ! -f "$keybackdoor" ]; then
    echo "Key backdoor file not found: $keybackdoor"
    exit 1
fi

# Check if folder exists
if [ ! -d "$folder" ]; then
    echo "Folder not found: $folder"
    exit 1
fi

# Create output directory if it doesn't exist
mkdir -p "$(dirname "$output")"

# Perform the search for backdoors
while IFS= read -r backdoor; do
    grep -rlI  "$backdoor" "$folder" | while IFS= read -r file; do
        echo "Found backdoor/malicious file: $file ($(stat -c '%y' "$file"))"
    done
done < "$keybackdoor" >> "$output"

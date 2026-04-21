#!/bin/bash

# Check if env exists
if [ ! -d "venv" ]; then
    echo "Error: no environment found"
    echo "Run ./setup.sh"
    exit 1
fi

# Check if filename argument is provided
if [ -z "$1" ]; then
    echo "Error: no filename"
    echo "Usage: ./run.sh <filename>"
    echo "Example: ./run.sh metrics_example.csv"
    exit 1
fi

# Check if file exists in data/ directory
if [ ! -f "data/$1" ]; then
    echo "Error: file 'data/$1' not found"
    echo "Available files in data/:"
    ls -1 data/ 2>/dev/null || echo "  (no files found)"
    exit 1
fi

# Run the script
source venv/bin/activate
python main.py "$1"
deactivate
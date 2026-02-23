#!/bin/bash

# Check that exactly two arguments were provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <num1> <num2>"
    exit 1
fi

# Function to check if value is an integer
is_integer() {
    [[ $1 =~ ^-?[0-9]+$ ]]
}

# Validate both arguments
if ! is_integer "$1"; then
    echo "Error: '$1' is not a valid integer."
    exit 1
fi

if ! is_integer "$2"; then
    echo "Error: '$2' is not a valid integer."
    exit 1
fi

# Assign arguments to variables
num1=$1
num2=$2

# Add them
sum=$((num1 + num2))

# Print result
echo "Sum: $sum"
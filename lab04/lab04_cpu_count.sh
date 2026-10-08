#!/bin/bash
# Lab 04 - Exercise 1
# Usage: ./lab04_cpu_.sh <min_cores>
# Example: ./lab04_cpu_.sh 4
# Checks VM has at least <min_cores> CPU cores

# runs grep to count lines starting with processor and stores the value 
num_cpu=$(grep -c "^processor" /proc/cpuinfo)

#Comparing 
nproc_cpu=$(nproc)
echo "cpuinfo reports: $num_cpu core(s), nproc reports: $nproc_cpu core(s)"

# Check if enough cores available
if [ "$num_cpu" -ge "$1" ]; then
    echo "OK: $num_cpu cores available (required $1)"
else
    echo "Error: only $num_cpu cores available, but $1 required" 
    exit 1
fi


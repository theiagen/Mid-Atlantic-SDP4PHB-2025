#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR=$(dirname "$0")

# Check if a FASTQ file is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <fastq_file>"
    exit 1
fi

FASTQ_FILE=$1

# Check if the provided file exists
if [ ! -f "$FASTQ_FILE" ]; then
    echo "Error: File '$FASTQ_FILE' not found!"
    exit 1
fi

echo "Processing FASTQ file: $FASTQ_FILE"

# Count number of reads in FASTQ file
## Count the number of lines in the FASTQ file
LINE_COUNT=$(wc -l < "$FASTQ_FILE")
## Calculate the number of reads (4 lines per read)
READ_COUNT=$((LINE_COUNT / 4))

echo "Number of reads in $FASTQ_FILE: $READ_COUNT"

# Count the number of total bases in the FASTQ file 
for ((i = 1; i <= READ_COUNT; i++)); do 
    # Extract the second line of each read (the sequence line)
    READ=$(sed -n "$((i * 4 - 2))p" "$FASTQ_FILE")
    # Calculate the length of the read
    READ_LENGTH=${#READ}
    # Calculate the total number of bases
    TOTAL_BASE_COUNT=$((TOTAL_BASE_COUNT + READ_LENGTH))
    # Store the sequence in a variable
    TOTAL_BASES+="$READ"
    # Print the length of the sequence
    #echo "Length of read $i: $READ_LENGTH"
done

# Print the total number of bases
#echo "Total bases: $TOTAL_BASE_COUNT"

# Print the complete sequence
#echo "Complete sequence: $TOTAL_BASES"

# Calculate the number of GC bases in the FASTQ file
GC_TOTAL=$(echo "$TOTAL_BASES" | grep -o '[GC]' | wc -l)

# Ptint the GC total
#echo "GC total: $GC_TOTAL"

# Scaled GC total
GC_SCALED=$((GC_TOTAL * 100))

# Calculate the GC percentage
GC_PERCENTAGE=$(($GC_SCALED / $TOTAL_BASE_COUNT))

# Report the GC percentage
echo "GC percentage: $GC_PERCENTAGE%"

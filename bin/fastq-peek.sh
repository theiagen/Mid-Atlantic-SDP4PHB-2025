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


# Calculate GC count
GC_COUNT=$(cat "$FASTQ_FILE" | grep -o -E "G|C" | wc -l)

echo "GC Count: $GC_COUNT"

# Calculate total base count
TOTAL_BASE_COUNT=$(cat "$FASTQ_FILE" | grep -o -E "A|T|G|C" |  wc -l)

echo "Total number of bases: $TOTAL_BASE_COUNT"

# Calculate GC Percent
GC_PERCENT=$((100*$GC_COUNT/$TOTAL_BASE_COUNT))

echo "GC Percent : $GC_PERCENT%"
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

# Calculate percent GC of all fastq reads in file
## Confirm processing of sequence line
#awk 'NR % 4 == 2' $FASTQ_FILE > 'test.out'

## Get total of non-ambiguous bases and total of GC bases
TOTAL_BASE_COUNT=$(awk 'NR % 4 == 2' "$FASTQ_FILE" | tr -cd 'ACGT' | wc -c)
GC_COUNT=$(awk 'NR % 4 == 2' "$FASTQ_FILE" | tr -cd 'GC' | wc -c)
#echo "$TOTAL_BASE_COUNT"
#echo "$GC_COUNT"
GC_PERCENT=$(awk "BEGIN {print $GC_COUNT / $TOTAL_BASE_COUNT * 100}")

echo "$FASTQ_FILE GC Content: $GC_PERCENT"
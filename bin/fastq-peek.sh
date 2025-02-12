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

# Count total bases and calculate GC percentage
TOTAL_BASE_COUNT=$(sed -n '2~4p' $FASTQ_FILE | grep -o '[ATGCNatgcn]' | wc -l)
GC_COUNT=$(sed -n '2~4p' "$FASTQ_FILE" | grep -o '[GCgc]' | wc -l)
#GC_FRAC=$(($GC_COUNT / $TOTAL_BASE_COUNT))
#GC_PERCENT=$((GC_FRAC * 100))
#GC_PERCENT=$(echo "($GC_COUNT / $TOTAL_BASE_COUNT) * 100" | bc)
#GC_PERCENT=$(($(($GC_COUNT / $TOTAL_BASE_COUNT)) * 100))
GC_PERCENT=$(awk "BEGIN {print ($GC_COUNT / $TOTAL_BASE_COUNT) * 100}")

#echo $TOTAL_BASE_COUNT
#echo $GC_COUNT
#echo $GC_PERCENT
echo "The GC content in $FASTQ_FILE: $GC_PERCENT%"
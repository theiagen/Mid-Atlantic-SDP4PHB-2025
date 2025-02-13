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
## Remove AT from every 2nd line; get the length of that line
GC_COUNT=$(awk '(NR%4==2) {gsub(/[ATNatn]/, ""); N+=length($0);}END{print N;}' < "$FASTQ_FILE")
## Get the length of every 2nd line
TOTAL_BASE_COUNT=$(awk '(NR%4==2) {N+=length($0);}END{print N;}' < "$FASTQ_FILE")
## Calculate GC content of file
GC_PERCENT=$(echo $GC_COUNT $TOTAL_BASE_COUNT | awk '{ print $1/$2*100 }')

echo "Number of reads in $FASTQ_FILE: $READ_COUNT"
printf "GC content in %s: %.2f%%\n" $FASTQ_FILE $GC_PERCENT
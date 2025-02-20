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
#READ_COUNT=$((LINE_COUNT / 4))
READ_COUNT=$(zgrep . $FASTQ_FILE | awk 'NR%4==2{c++} END{ print c }')

echo "Number of reads in $FASTQ_FILE: $READ_COUNT"

#Count the number of G and C nucleotides within the input fastq file (GC_COUNT)
GC_COUNT=$(zgrep . $FASTQ_FILE | awk 'NR%4==2{gsub(/[aAtTnN]/,"");N+=length($0);} END{ print N }')
echo "Number of GC in $FASTQ_FILE: $GC_COUNT"

#Count the total number of nucleotides within the input fastq file (TOTAL_BASE_COUNT)
TOTAL_BASE_COUNT=$(zgrep . $FASTQ_FILE | awk 'NR%4==2{l+=length($0)} END{ print l }')
echo "Number of Nucleotides in $FASTQ_FILE: $TOTAL_BASE_COUNT"

#Calcuate GC content as a percentage: (GC Count / Total Base Count) *100 (GC_PERCENT)
## requires install of bc
## apt-get update
## apt-get install bc
GC_PERCENT=$(echo "scale=2; ($GC_COUNT/$TOTAL_BASE_COUNT)*100" | bc)
#To report the GC content, we will print the GC_PERCENT value to stdout, i.e. "GC content in {input_fastq_file}: {GC_PERCENT}%"
echo "GC content in {$FASTQ_FILE}: {$GC_PERCENT}%"
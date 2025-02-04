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

# Count number of G and C nucleotides
# Initialize COUNT variables
GC_COUNT=0
ALL_NUCLEOTIDES_COUNT=0

##Go through fastq line by line
while IFS= read -r line; do 
    ##Find the lines that contain alphabetical letters,
    ##but does not start with @
    if [[ $line == [A-Za-z]* && $line != "@"* ]]; then
        #Count number of letters in line
        NUCLEOTIDE_per_LINE=$(($(echo $line| wc -c) - 1))
        ALL_NUCLEOTIDES_COUNT=$(($NUCLEOTIDE_per_LINE +  $ALL_NUCLEOTIDES_COUNT))
        #Count number G's in line
        G_COUNT=$(echo $line| grep -o -i "G" | wc -l)
        #Count number of C's in line
        C_COUNT=$(echo $line| grep -o -i "C" | wc -l)
        GC_COUNT=$(($GC_COUNT + $G_COUNT + $C_COUNT))
    fi;
done < $FASTQ_FILE

#Calculate GC content
GC_PERCENT=$(awk "BEGIN { print $GC_COUNT / $ALL_NUCLEOTIDES_COUNT }")
GC_PERCENTAGE=$(awk "BEGIN { print $GC_PERCENT * 100 }")

echo "GC content in $FASTQ_FILE: ${GC_PERCENTAGE}%"
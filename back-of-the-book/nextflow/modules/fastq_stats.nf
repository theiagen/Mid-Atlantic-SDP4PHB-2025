process fastqStats {
    input:
        path inputFile

    output:
        stdout

    script:
        """
        # Count number of reads in FASTQ file
        ## Count the number of lines in the FASTQ file
        LINE_COUNT=\$(wc -l < "${inputFile}")
        ## Calculate the number of reads (4 lines per read)
        READ_COUNT=\$((LINE_COUNT / 4))

        echo "Number of reads in ${inputFile}: \$READ_COUNT"

        # Calculate Percent GC
        ## Count the number of G and C nucleotides
        GC_COUNT=\$(grep -E '^[ATCGN]+\$' "${inputFile}" | tr -cd 'GCgc' | wc -c)
        ## Count the total number of nucleotides (A, T, C, G)
        TOTAL_BASE_COUNT=\$(grep -E '^[ATCGN]+\$' "${inputFile}" | tr -cd 'ATCGatcg' | wc -c)
        ## Calculate the GC content as a percentage
        GC_CONTENT=\$(awk "BEGIN {print (\$GC_COUNT / \$TOTAL_BASE_COUNT) * 100}")

        echo "GC content in ${inputFile}: \$GC_CONTENT%"
        """
}
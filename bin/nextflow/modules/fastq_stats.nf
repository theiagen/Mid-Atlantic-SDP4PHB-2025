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

        # Count total bases and calculate GC percentage
        TOTAL_BASE_COUNT=\$(sed -n '2~4p' "${inputFile}" | grep -o '[ATGCNatgcn]' | wc -l)
        GC_COUNT=\$(sed -n '2~4p' "${inputFile}" | grep -o '[GCgc]' | wc -l)
        GC_PERCENT=\$(awk "BEGIN {print (\$GC_COUNT / \$TOTAL_BASE_COUNT) * 100}")

        echo "The GC content in ${inputFile}: \$GC_PERCENT%"
        """
}
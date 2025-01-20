#!/usr/bin/env nextflow

nextflow.enable.dsl=2

process fastq_stats {
    input:
    path fastq_file

    output:
    stdout result

    script:
    """
    fastq-peek.sh ${fastq_file}
    """
}

workflow {
    params.fastq_file = file(params.fastq_file)

    fastq_stats(params.fastq_file)
}
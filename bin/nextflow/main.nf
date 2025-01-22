#!/usr/bin/env nextflow
nextflow.enable.dsl=2

// Correctly include the process definition from the module
include { fastqStats } from './modules/fastq_stats'

workflow {
    // Define the input channel from the user-specified path
    IN_FilePath = Channel.fromPath(params.input).ifEmpty { 
        exit 1, "No file provided with pattern: ${params.input}"
    }

    // Execute the 'fastqStats' process
    fastqStats(IN_FilePath) | view
}

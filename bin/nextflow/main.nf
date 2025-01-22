#!/usr/bin/env nextflow
nextflow.enable.dsl=2

// Correctly include the process definition from the module
include { countLines } from './modules/count_lines'

workflow {
    // Define the input channel from the user-specified path
    IN_FilePath = Channel.fromPath(params.input).ifEmpty { 
        exit 1, "No file provided with pattern: ${params.input}"
    }

    // Execute the 'countLines' process
    resultChannel = countLines(IN_FilePath)

    // Print the countLines output to the console
    resultChannel.view()
}

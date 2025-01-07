# Design Document

## Problem Statement

Our colleagues are routinely utilizing the [fastq-peek.sh](../bin/fastq-peek.sh) software to assess NGS data generated in the laboratory. The outputs, however, do not capture GC-content which is necessary for more robust quality assessment of specimens.

## Objectives

Provide a solution to calculate and report GC content for our collegues.

## Proposed Solution

Update the [fastq-peek.sh](../bin/fastq-peek.sh) software to calculate and report GC content.

To calculate GC content, we will:

1. Count the number of G and C nucleotides within the input fastq file (`GC_COUNT`)
2. Count the total number of nucleotides within the input fastq file (`TOTAL_BASE_COUNT`)
3. Calcuate GC content as a percentage: `(GC Count / Total Base Count) *100` (`GC_PERCENT`)

To report the GC content, we will print the `GC_PERCENT` value to `stdout`, i.e. `"GC content in {input_fastq_file}: {GC_PERCENT}%"`

## Implementation Plan

1. Create a dev environment and a Git branch to ensure development does not interfere with production software 
2. Add bash one-liners to [fastq-peek.sh](../bin/fastq-peek.sh) to calculate:
    - `GC_COUNT`, `TOTAL_BASE_COUNT`, & `GC_PERCENT`
3. Print the calculated `GC_PERCENT` value to stdout.
4. Test solution using [benchmark read data](https://github.com/theiagen/DCLS-SDP4PHB-2025/blob/main/data/sample.fastq)
    - Calculated GC Content for this input fastq file should equal 50%
5. Create a PR and merge these changes to main
6. Issue a static version release with semantic versioning (minor release)
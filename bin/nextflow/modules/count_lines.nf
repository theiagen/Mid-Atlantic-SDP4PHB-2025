process countLines {
    publishDir params.results, mode: 'symlink'
    input:
    path inputFile

    output:
    file 'result.txt'

    script:
    """
    wc -l $inputFile > result.txt
    """
}

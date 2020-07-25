#!/usr/bin/env nextflow


/*
#==============================================
code documentation
#==============================================
*/

/*
#==============================================
params
#==============================================
*/

params.saveBy = 'copy'
params.R2 = false


/*
#==============================================
spotyping
#==============================================
*/

Channel.fromFilePairs("./*_{R1,R2}.p.fastq")
        .into { ch_in_spotyping }


process spotyping {
    container 'abhi18av/spotyping'
    publishDir 'results/spotyping', mode: params.saveBy

    input:
    set genomeFileName, file(genomeReads) from ch_in_spotyping

    output:
    tuple file('*.txt'),
            file('SITVIT*.xls') into ch_out_spotyping

    script:
    genomeName = genomeFileName.toString().split("\\_")[0]
    genomeReadToBeAnalyzed = params.R2 ? genomeReads[1] : genomeReads[0]

    """
    python /SpoTyping-v2.0/SpoTyping-v2.0-commandLine/SpoTyping.py ./${genomeReadToBeAnalyzed} -o ${genomeName}.txt
    """

}

/*
#==============================================
# extra
#==============================================
*/

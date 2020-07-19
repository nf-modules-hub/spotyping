#!/usr/bin/env nextflow

/*
################
params
################
*/


params.saveBy = 'copy'




/*
###############
Spotyping
###############
*/


Channel.fromFilePairs("./*_{R1,R2}.p.fastq")
        .into { ch_in_spotyping }




process spotyping {
    container 'abhi18av/spotyping'
    publishDir 'results/spotyping', mode: params.saveBy

    input:
    set genomeFileName, file(genomeReads) from ch_in_spotyping

    output:
    tuple path """${genomeName}.txt""", file 'SITVIT*.xls' into ch_out_spotyping

    script:
    genomeName= genomeFileName.toString().split("\\_")[0]

    """
    python /SpoTyping-v2.0/SpoTyping-v2.0-commandLine/SpoTyping.py ./${genomeReads[0]} -o ${genomeName}.txt
    """
    
}

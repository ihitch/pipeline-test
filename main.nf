#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process test {
    pod = [priorityClassName: "$params.pcm"]
    
    script:
    """
    sleep ${params.sleep}
    """
}

workflow {
    test()
}

/*Channel
     .fromPath("$params.path")
     .splitFasta( by: 10 )
     .view()
*/
 

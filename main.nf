#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process test {
    pod = [priorityClassName: "$params.pcm"]
    
    script:
    """
    echo 'Starting A'
    sleep 10
    printf 'Finished A'
    """
}


/*Channel
     .fromPath("$params.path")
     .splitFasta( by: 10 )
     .view()
*/
 

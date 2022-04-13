#!/usr/bin/env nextflow

process A {
    pod = [priorityClassName: $params.pcm]
    
    output:
    file 'a'
    
    """
    echo 'Starting A'
    echo 'Hello' > a
    sleep 10
    echo 'Finished A'
    """
}


/*Channel
     .fromPath("$params.path")
     .splitFasta( by: 10 )
     .view()
*/
 

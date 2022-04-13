#!/usr/bin/env nextflow
nextflow.enable.dsl=2
params.sleep = 2
params.pcm = "medium-priority-np"

/*process test {
    pod = [priorityClassName: "${params.pcm}"]
    
    script:
    """
    sleep ${params.sleep}
    """
}*/

pod = [priorityClassName: "${params.pcm}"]
Channel
     .fromPath("$params.path")
     .splitFasta( by: 10 )
     .view()

 

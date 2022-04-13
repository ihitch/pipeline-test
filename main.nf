#!/usr/bin/env nextflow
nextflow.enable.dsl=2
params.sleep = 2
params.pcm = "medium-priority-np"
params.memory = '2 GB'

process test {
    container = 'nextflow/examples:latest'
    pod priorityClassName: "${params.pcm}"
    memory "${params.memory}"
    
    script:
    """
    sleep ${params.sleep}
    """
}

workflow {
    test()
}

/*pod = [priorityClassName: "${params.pcm}"]
Channel
     .fromPath("$params.path")
     .splitFasta( by: 10 )
     .view()
*/
 

#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

workflow {
    ids = Channel.fromPath('input/ids.txt')
    chunksize = Channel.value(1)
    split_ids(ids, chunksize)
}
process split_ids {
    input:
    path(ids)
    val(chunksize)
 
    output:
    file('batch-*')
 
    shell:
    """
    split -l !{chunksize} !{ids} batch-
    """
}



/*
process pozdrav {
  
  input: 
    val x
  output:
    stdout
  script:
    """
    echo '$x!'
    """
}

workflow {
  Channel.of('Ahoj') | sayHello | view
}


#!/usr/bin/env nextflow
nextflow.enable.dsl=2
params.sleep = 2
params.pcm = "medium-priority-np"

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

pod = [priorityClassName: "${params.pcm}"]
Channel
     .fromPath("$params.path")
     .splitFasta( by: 10 )
     .view()
*/
 

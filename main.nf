#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process pozdrav {
  
  input: 
    val x


  script:
    """
    echo '$x!' > output/pozdrav.txt
    """
}

workflow {
  Channel.of('Ahoj') | pozdrav
}

/*
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
 

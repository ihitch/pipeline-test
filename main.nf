#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process sayHello {
  container = 'quay.io/nextflow/bash'
  cpus 0.1
  pod priorityClassName: "low-priority-np"
  
  input: 
    val x
  output:
    stdout
  script:
    """
    echo '$x world!'
    """
}

workflow {
  Channel.of('Ahoj') | sayHello | view
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
 

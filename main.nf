#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process pozdrav {
  
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
  Channel.of('Ahoj', 'Hello') | pozdrav | view
}

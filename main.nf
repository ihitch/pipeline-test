#!/usr/bin/env nextflow


Channel
     .fromPath("$params.path")
     .splitFasta( by: 10 )
     .view()
 

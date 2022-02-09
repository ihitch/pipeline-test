#!/usr/bin/env nextflow

count = 0


input_file.splitFasta( by: 10, limit: 100 ) { 
  println it;
  count++
} 


println "Total fasta splits: $count"
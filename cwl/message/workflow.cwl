#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: awk
inputs:
 message:
  type: string
  inputBinding:
   position: 1
 filename:
  type: File?
  inputBinding:
   position: 2
outputs: []

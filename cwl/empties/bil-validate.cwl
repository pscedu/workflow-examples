#!/usr/bin/env cwl-runner
cwlVersion: v1.2
class: Workflow

inputs:
  directory: 
    type: Directory

outputs:
  out_empties:
    type: File
    outputSource: quality_control_1/out_empties


steps:
  quality_control_1:
    run: 
      cwlVersion: v1.0
      class: CommandLineTool
      baseCommand: [bash,"/bil/pscstaff/rlagha/RL/forLuke/scripts/empties2.sh"]
      stdout: out_empties.txt
      inputs:
        directory:
          type: Directory
          inputBinding: {}
      outputs:
        out_empties:
          type: stdout
    in:
      directory: directory
    out: [out_empties]


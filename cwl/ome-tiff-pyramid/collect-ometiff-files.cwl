#!/usr/bin/env cwl-runner
class: CommandLineTool
id: Collect OME-TIFF files
label: Collect OME-TIFF files
cwlVersion: v1.1

requirements:
  DockerRequirement:
    dockerPull: hubmap/ome-tiff-pyramid:latest
  InlineJavascriptRequirement: {}

  InitialWorkDirRequirement:
    listing:
      - $(inputs.ometiff_directory)

inputs:
  ometiff_directory:
    type: Directory
    inputBinding:
      position: 1
    doc: The directory OME-TIFF files

outputs:
  ometiff_file:
    type: File[]
    outputBinding:
      glob: "ometiffs.json"
      loadContents: true
      outputEval: ${return JSON.parse(self[0].contents).files;}
  base_directory:
    type: string[]
    outputBinding:
      glob: "ometiffs.json"
      loadContents: true
      outputEval: ${return JSON.parse(self[0].contents).directories;}

baseCommand: [/opt/collect_ometiff_files.py]

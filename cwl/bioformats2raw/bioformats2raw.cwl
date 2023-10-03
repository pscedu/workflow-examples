#!/usr/bin/env cwl-runner

cwlVersion: v1.1
class: CommandLineTool
requirements:
  DockerRequirement:
    dockerPull: hubmap/ome-tiff-pyramid:latest

inputs:
  ometiff_file:
    type: File
    inputBinding:
      position: 0
  base_directory:
    type: string
    inputBinding:
      position: 1
  processes:
    type: int
    inputBinding:
      position: 2
  rgb:
    type: boolean?
    default: false
    inputBinding:
      prefix: --rgb
      position: 3
  downsample_type:
    type: string?
    inputBinding:
      prefix: --downsample-type
      position: 4

outputs:
  pyramid_dir:
    type: Directory
    outputBinding:
      glob: 'ometiff-pyramids'
  n5_dir:
    type: Directory
    outputBinding:
      glob: 'n5'

baseCommand: ['python3', '/opt/ometiff_to_pyramid.py']

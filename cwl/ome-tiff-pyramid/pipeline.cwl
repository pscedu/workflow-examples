#!/usr/bin/env cwl-runner
class: Workflow
cwlVersion: v1.1
requirements:
  ScatterFeatureRequirement: {}

inputs:
  ometiff_directory:
    type: Directory
  processes:
    type: int
    default: 1
  rgb:
    type: boolean?
  downsample_type:
    type: string?

outputs:
  pyramid_dir:
    type: Directory[]
    outputSource: convert_to_pyramid/pyramid_dir
  n5_dir:
    type: Directory[]
    outputSource: convert_to_pyramid/n5_dir

steps:
  collect_ometiff_files:
    run: collect-ometiff-files.cwl
    in:
      ometiff_directory: ometiff_directory
    out:
      [ometiff_file, base_directory]

  convert_to_pyramid:
    scatter: [ometiff_file, base_directory]
    scatterMethod: dotproduct
    run: steps/ometiff-to-pyramid.cwl
    in:
      ometiff_file: collect_ometiff_files/ometiff_file
      base_directory: collect_ometiff_files/base_directory
      processes: processes
      rgb: rgb
      downsample_type: downsample_type
    out: [pyramid_dir, n5_dir]

#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: fortune
inputs: []
outputs: []

requirements:
  - class: DockerRequirement
    dockerPull: piegsaj/fortune

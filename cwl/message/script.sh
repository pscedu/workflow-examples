#!/bin/bash

module load anaconda3

cwl-runner workflow.cwl input.yaml

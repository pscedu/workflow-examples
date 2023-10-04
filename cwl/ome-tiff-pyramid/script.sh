#!/bin/bash

#SBATCH -p RM-shared
#SBATCH -n 10
#SBATCH --mem=20000M

module load anaconda3
export PATH=$PATH:~/.local/bin/

cwl-runner --singularity pipeline.cwl input.yaml

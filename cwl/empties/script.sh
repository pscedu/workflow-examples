#!/bin/bash

#SBATCH -p RM-shared
#SBATCH -n 5
#SBATCH --mem=10000M

module load anaconda3

cwl-runner  --relax-path-checks bil-validate.cwl input.yml

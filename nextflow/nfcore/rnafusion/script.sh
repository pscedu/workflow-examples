#!/bin/bash

#SBATCH -p RM-shared

module load nextflow
module load AI/anaconda3-tf2.2020.11

conda activate ./venv
nextflow run nf-core/rnafusion -r 2.1.0 -profile test --outdir results

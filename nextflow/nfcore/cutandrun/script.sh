#!/bin/bash
#SBATCH -p RM-shared

module load AI/anaconda3-tf2.2020.11
module load nextflow

#these tools are needed for the workflow below
module load bedtools
module load samtools

nextflow run nf-core/cutandrun -r 3.0 -profile test --outdir ./results

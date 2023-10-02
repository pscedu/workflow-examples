#!/bin/bash
#SBATCH -p RM-shared

if [ -f ~/bin/nextflow ]; then
	export PATH=$PATH:~/bin
fi

module load AI/anaconda3-tf2.2020.11

#these tools are needed for the workflow below
module load bedtools
module load samtools

nextflow run nf-core/cutandrun -r 3.0 -profile test --outdir ./results

#!/bin/bash
#SBATCH -p RM-shared

export PATH=~/bin:$PATH
export NXF_SINGULARITY_CACHEDIR=./containers

if [ ! -d ./containers ]; then mkdir ./containers; fi
~/bin/nextflow run nf-core/atacseq -r 2.1.2 -profile test --outdir ./results -c psc.config

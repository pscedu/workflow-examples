#!/bin/bash

#SBATCH -p RM-shared

module load nextflow

export NXF_SINGULARITY_CACHEDIR=./containers
if [ ! -d ./containers ]; then mkdir ./containers; fi

nextflow run nf-core/rnaseq -profile test --outdir results -c psc.config

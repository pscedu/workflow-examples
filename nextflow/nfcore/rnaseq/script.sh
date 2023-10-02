#!/bin/bash

#SBATCH -p RM-shared

if [ -f ~/bin/nextflow ]; then
	export PATH=$PATH:~/bin/
fi

export NXF_SINGULARITY_CACHEDIR=./containers
if [ ! -d ./containers ]; then mkdir ./containers; fi

nextflow run nf-core/rnaseq -profile test --outdir results -c psc.config

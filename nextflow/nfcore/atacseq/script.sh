#!/bin/bash
#SBATCH -p RM-shared

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export PATH=~/bin:$PATH
export NXF_SINGULARITY_CACHEDIR=./containers

if [ ! -d ./containers ]; then mkdir ./containers; fi
nextflow run nf-core/atacseq -r 2.1.2 -profile test --outdir ./results -c psc.config

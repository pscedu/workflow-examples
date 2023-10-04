#!/bin/bash

#SBATCH -p RM-shared

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export PATH=~/bin:$PATH
export NXF_SINGULARITY_CACHEDIR=./containers

nextflow run nf-core/rnafusion -r 2.1.0 -profile test --outdir results

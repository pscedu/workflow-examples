#!/bin/bash
#SBATCH -p RM-shared
#SBATCH -n 10
#SBATCH --mem=20000M

module load anaconda3
module load FastQC
module load samtools

pip install multiqc --user -q

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export PATH=~/bin:~/.local/bin/:$PATH
export NXF_SINGULARITY_CACHEDIR=./containers

if [ ! -d ./containers ]; then mkdir ./containers; fi
nextflow run nf-core/bamtofastq -r 2.0.0 -profile test --outdir ./results

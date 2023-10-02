#!/bin/bash

#SBATCH -p RM-shared
#SBATCH -n 15

module load nextflow
module load AI/anaconda3-tf2.2020.11

NXF_SINGULARITY_CACHEDIR=singularity
if [ ! -d singularity ]; then mkdir singularity; fi

if [ ! -f ./singularity/docker.io-clinicalgenomics-fusioncatcher-1.33.img.pulling.1668529750473 ]; then
	cd singularity
	singularity pull  --name docker.io-clinicalgenomics-fusioncatcher-1.33.img.pulling.1668529750473 docker://docker.io/clinicalgenomics/fusioncatcher:1.33
	cd ..
fi

conda create --prefix ./venv -y
conda activate ./venv
conda install -c bioconda ucsc-gtftogenepred

# Register at COSMIC at https://cancer.sanger.ac.uk/cosmic/register
EMAIL='icaoberg@psc.edu'
PASSWORD='xGWL33!t7e8FKWf'

nextflow run nf-core/rnafusion \
  -r 2.1.0 \
  --build_references --all \
  --cosmic_username $EMAIL --cosmic_passwd $PASSWORD \
  --genomes_base ./work \
  --outdir ./work \
  -c psc.config

#!/bin/bash

#SBATCH -p RM-shared
#SBATCH -n 10
#SBATCH --mem=20000M

module load anaconda3
pip install cwl-runner --user
wget -nc https://downloads.openmicroscopy.org/images/OME-TIFF/2016-06/BBBC/NIRHTa-001.ome.tiff
cwl-runner --singularity bioformats2raw.cwl input.yaml

#!/bin/bash

#SBATCH -p RM-shared
#SBATCH -n 5
#SBATCH --mem=10000M

wget -nc https://downloads.openmicroscopy.org/images/OME-TIFF/2016-06/BBBC/NIRHTa-001.ome.tiff
cwl-runner --singularity bioformats2raw.cwl input.yaml

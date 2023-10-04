#!/bin/bash

#SBATCH -p RM-small

module load anaconda3
pip install snakemake --user
snakemake --cores 1

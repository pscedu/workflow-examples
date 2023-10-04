#!/bin/bash

#SBATCH -p RM-small

module load anaconda3
pip install snakemake --user -q
snakemake --cores 1

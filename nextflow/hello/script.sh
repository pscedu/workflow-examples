#!/bin/bash

#SBATCH -p RM-small

module load nextflow
nextflow run hello

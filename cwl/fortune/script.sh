#!/bin/bash

#SBATCH -p RM-small

module load anaconda3
cwl-runner --singularity fortune.cwl

#!/bin/bash

#SBATCH -p RM-small

cwl-runner --relax-path-checks weather.cwl

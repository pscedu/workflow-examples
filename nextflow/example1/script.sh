#!/bin/bash

#SBATCH -p RM-small

export NXF_DEFAULT_DSL=1

if [ ! -f genome_tree.fasta ]; then
	cp -v /ocean/datasets/community/genomics/checkm/20210915/genome_tree/genome_tree_reduced.refpkg/genome_tree.fasta .
fi

module load nextflow
nextflow workflow

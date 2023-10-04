#!/bin/bash

export PATH=$PATH:~/.local/bin

wget -nc --quiet https://raw.githubusercontent.com/ruanyf/fortunes/master/data/fortunes

pip install fortune --user -q
pip install snakemake --user -q

snakemake --cores 1

if [ -f fortunes ]; then
	rm -f fortunes
fi

#!/bin/bash

USER=$1
singularity push -U singularity-imagemagick-7.1.1-15.sif library://$1/pscedu/imagemagick:7.1.1-15

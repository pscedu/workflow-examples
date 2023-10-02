#!/bin/bash

USER=$1
singularity push -U singularity-lazygit-0.31.4.sif library://$1/pscedu/lazygit:0.31.4

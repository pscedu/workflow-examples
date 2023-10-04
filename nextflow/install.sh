#!/bin/bash

cd /ocean/projects/cis230059p/$(whoami)


mkdir sdkman && ln -s $(pwd)/sdkman $HOME/.sdkman
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 17.0.6-amzn

if [ ! -d ~/bin ]; then mkdir ~/bin; fi
cd ~/bin && curl -s https://get.nextflow.io | bash
chmod +x ~/bin/nextflow
export PATH=$PATH:~/bin

#!/bin/bash

script=$1

if [ "$script" == "01_download.sh" ]; then
  ln -s /core/cbc/tutorials/workshopdirs/Single-Cell-Transcriptomics/resources/Mus_musculus.GRCm39/Mus_musculus.GRCm39.115.chr.gtf
  ln -s /core/cbc/tutorials/workshopdirs/Single-Cell-Transcriptomics/resources/Mus_musculus.GRCm39/Mus_musculus.GRCm39.dna.primary_assembly.fa
  ln -s /core/cbc/tutorials/workshopdirs/Single-Cell-Transcriptomics/resources/Mus_musculus.GRCm39/01_download*.out 
elif [ "$script" == "02_star_index.sh" ]; then
  ln -s /core/cbc/tutorials/workshopdirs/Single-Cell-Transcriptomics/resources/Mus_musculus.GRCm39/star_index
  ln -s /core/cbc/tutorials/workshopdirs/Single-Cell-Transcriptomics/resources/Mus_musculus.GRCm39/02_star_index*.out 
else
    echo "Unknown script: $script"
fi
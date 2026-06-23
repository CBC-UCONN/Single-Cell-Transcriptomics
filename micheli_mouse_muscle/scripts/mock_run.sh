#!/bin/bash

script=$1

if [ ! -d "logs" ]; then
  mkdir logs
fi

if [ "$script" == "00_download.sh" ]; then
  if [ ! -d "../raw_data" ]; then
    mkdir ../raw_data
  fi
  ln -s /core/cbc/tutorials/workshopdirs/Single-Cell-Transcriptomics/micheli_mouse_muscle/raw_data  ../raw_data
  for f in /core/cbc/tutorials/workshopdirs/Single-Cell-Transcriptomics/micheli_mouse_muscle/scripts/logs/00_download*.out; do ln -s "$f" logs/; done

elif [ "$script" == "01_fastqc_raw.sh" ]; then
  if [ ! -d "../results" ]; then
    mkdir ../results
  fi
  ln -s /core/cbc/tutorials/workshopdirs/Single-Cell-Transcriptomics/micheli_mouse_muscle/results/01_fastqc_raw ../results/01_fastqc_raw
  for f in /core/cbc/tutorials/workshopdirs/Single-Cell-Transcriptomics/micheli_mouse_muscle/scripts/logs/01_fastqc*.out; do ln -s "$f" logs/; done

elif [ "$script" == "02_multiqc_raw.sh" ]; then
  if [ ! -d "../results" ]; then
    mkdir ../results
  fi
  ln -s /core/cbc/tutorials/workshopdirs/Single-Cell-Transcriptomics/micheli_mouse_muscle/results/02_multiqc_raw ../results/02_multiqc_raw
  for f in /core/cbc/tutorials/workshopdirs/Single-Cell-Transcriptomics/micheli_mouse_muscle/scripts/logs/02_multiqc*.out; do ln -s "$f" logs/; done

elif [ "$script" == "03_star.sh" ]; then
  if [ ! -d "../results" ]; then
    mkdir ../results
  fi
  ln -s /core/cbc/tutorials/workshopdirs/Single-Cell-Transcriptomics/micheli_mouse_muscle/results/03_star ../results/03_star
  for f in /core/cbc/tutorials/workshopdirs/Single-Cell-Transcriptomics/micheli_mouse_muscle/scripts/logs/03_star*.out; do ln -s "$f" logs/; done

elif [ "$script" == "04_multiqc_star.sh" ]; then
  if [ ! -d "../results" ]; then
    mkdir ../results
  fi
  ln -s /core/cbc/tutorials/workshopdirs/Single-Cell-Transcriptomics/micheli_mouse_muscle/results/04_multiqc_star ../results/04_multiqc_star
  for f in /core/cbc/tutorials/workshopdirs/Single-Cell-Transcriptomics/micheli_mouse_muscle/scripts/logs/04_multiqc_star*.out; do ln -s "$f" logs/; done

else
    echo "Unknown script: ${script}"
fi
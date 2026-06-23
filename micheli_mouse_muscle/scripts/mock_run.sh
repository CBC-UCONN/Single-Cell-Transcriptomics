#!/bin/bash

script=$1

if ${script} == "00_download.sh"; then
  ln -s /core/cbc/tutorials/workshopdirs/Single-Cell-Transcriptomics/micheli_mouse_muscle/raw_data  ../raw_data
elif ${script} == "01_fastqc.sh"; then
  ln -s /core/cbc/tutorials/workshopdirs/Single-Cell-Transcriptomics/micheli_mouse_muscle/results/01_fastqc_raw ../results/01_fastqc_raw
elif ${script} == "02_multiqc_raw.sh"; then
  ln -s /core/cbc/tutorials/workshopdirs/Single-Cell-Transcriptomics/micheli_mouse_muscle/results/02_multiqc_raw ../results/02_multiqc_raw
elif ${script} == "03_star.sh"; then
  ln -s /core/cbc/tutorials/workshopdirs/Single-Cell-Transcriptomics/micheli_mouse_muscle/results/03_star ../results/03_star
elif ${script} == "04_multiqc_start.sh"; then
  ln -s /core/cbc/tutorials/workshopdirs/Single-Cell-Transcriptomics/micheli_mouse_muscle/results/04_multiqc_star ../results/04_multiqc_star
else
    echo "Unknown script: ${script}"
fi
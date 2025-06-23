#!/bin/bash
#SBATCH --job-name=03_multiqc-raw
#SBATCH -c 1
#SBATCH --mem=8G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH -o logs/%x_%j.out


hostname
echo "Start time: $(date)"

module load MultiQC/1.15

indir=../results/02_fastqc_raw
outdir=../results/03_multiqc_raw

mkdir -p $outdir

multiqc -f -o $outdir $indir

echo "End time: $(date)"
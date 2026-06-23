#!/bin/bash
#SBATCH --job-name=04_multiqc_star
#SBATCH -c 1
#SBATCH --mem=8G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH -o logs/%x_%j.out

echo "Job running on: $(hostname)"
start=$(date +%s)
echo "Start time: $(date)"

module load MultiQC/1.15

indir=../results/03_star
outdir=../results/04_multiqc_star

mkdir -p $outdir

multiqc -f -o $outdir $indir

echo "End time: $(date)"
echo "Elapsed time: $(date -ud "@$(($(date +%s)-start))" +'%H hr %M min %S sec')"

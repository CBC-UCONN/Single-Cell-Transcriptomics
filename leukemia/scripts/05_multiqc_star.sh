#!/bin/bash
#SBATCH --job-name=05_multiqc-star
#SBATCH -c 1
#SBATCH --mem=8G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH -o logs/%x_%j.out


hostname
echo "Start time: $(date)"

module load MultiQC/1.15

indir=../results/04_star
outdir=../results/05_multiqc_star

mkdir -p $outdir

multiqc -f -o $outdir $indir

echo "End time: $(date)"
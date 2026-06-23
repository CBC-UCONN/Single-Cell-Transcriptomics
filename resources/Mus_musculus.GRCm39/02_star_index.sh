#!/bin/bash
#SBATCH --job-name=02_star_index
#SBATCH -c 8
#SBATCH --mem=32G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH -o %x_%j.out

echo "Job running on: $(hostname)"
start=$(date +%s)
echo "Start time: $(date)"

module load STAR/2.7.11b

STAR \
  --runThreadN 8 \
  --runMode genomeGenerate \
  --genomeDir star_index \
  --genomeFastaFiles Mus_musculus.GRCm39.dna.primary_assembly.fa \
  --sjdbGTFfile Mus_musculus.GRCm39.115.gtf \
  --sjdbOverhang 97

echo "End time: $(date)"
echo "Elapsed time: $(date -ud "@$(($(date +%s)-start))" +'%H hr %M min %S sec')"
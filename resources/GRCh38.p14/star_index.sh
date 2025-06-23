#!/bin/bash
#SBATCH --job-name=star_index
#SBATCH -c 8
#SBATCH --mem=24G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH -o logs/%x_%j.out

hostname
echo "Start time: $(date)"

module load STAR/2.7.11b

STAR \
  --runThreadN 8 \
  --runMode genomeGenerate \
  --genomeDir star_index \
  --genomeFastaFiles GRCh38.p14.fna \
  --sjdbGTFfile GRCh38.p14.gtf \
  --sjdbOverhang 97

echo "End time: $(date)"
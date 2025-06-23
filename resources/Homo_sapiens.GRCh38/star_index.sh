#!/bin/bash
#SBATCH --job-name=star_index
#SBATCH -c 4
#SBATCH --mem=32G
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
  --genomeFastaFiles Homo_sapiens.GRCh38.dna.primary_assembly.fa \
  --sjdbGTFfile Homo_sapiens.GRCh38.114.chr.gtf \
  --sjdbOverhang 97

echo "End time: $(date)"
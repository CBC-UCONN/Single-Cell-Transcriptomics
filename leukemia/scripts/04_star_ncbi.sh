#!/bin/bash
#SBATCH --job-name=04_star_ncbi
#SBATCH -c 8
#SBATCH --mem=64G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH -o logs/%x_%A_%a.out
#SBATCH --array=1-11

hostname
echo "Start time: $(date)"

module load STAR/2.7.11b

metadata=../metadata.csv
indir=../results/01_download
outdir=../results/04_star_ncbi

mkdir -p $outdir

# Get nth ID from the metadata file based on the SLURM array task ID and cut the first column of csv row
sample=$( awk "NR==${SLURM_ARRAY_TASK_ID}+1" $metadata | cut -d, -f2 )

STAR \
  --genomeDir ../../resources/GRCh38.p14/star_index \
  --readFilesIn ${indir}/${sample}_3.fastq.gz ${indir}/${sample}_2.fastq.gz \
  --runThreadN 8 \
  --soloType CB_UMI_Simple \
  --soloCBwhitelist ../../resources/737K-august-2016.txt \
  --soloUMIlen 10 \
  --readFilesCommand zcat \
  --outFileNamePrefix $outdir/${sample}. 

gzip $outdir/${sample}.Solo.out/Gene/filtered/*
gzip $outdir/${sample}.Solo.out/Gene/raw/*

echo "End time: $(date)"

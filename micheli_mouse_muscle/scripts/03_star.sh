#!/bin/bash
#SBATCH --job-name=03_star
#SBATCH -c 10
#SBATCH --mem=40G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH -o logs/%x_%A_%a.out
#SBATCH --array=1-9

echo "Job running on: $(hostname)"
start=$(date +%s)
echo "Start time: $(date)"

module load STAR/2.7.11b

samples=../biosample.csv
indir=../raw_data
outdir=../results/03_star

mkdir -p $outdir

# Get the nth row of the 2nd column (Sample) from the biosample.csv file
sample=$( awk "NR==${SLURM_ARRAY_TASK_ID}+1" $samples | cut -d, -f2 )

STAR \
  --genomeDir ../../resources/Mus_musculus.GRCm39/star_index \
  --readFilesIn $indir/${sample}_3.fastq.gz $indir/${sample}_2.fastq.gz \
  --runThreadN $SLURM_CPUS_PER_TASK \
  --soloType CB_UMI_Simple \
  --soloCBwhitelist ../../resources/737K-august-2016.txt \
  --soloUMIlen 10 \
  --soloFeatures Gene Velocyto \
  --readFilesCommand zcat \
  --outFileNamePrefix $outdir/$sample. 

gzip $outdir/$sample.Solo.out/Gene/filtered/*
gzip $outdir/$sample.Solo.out/Gene/raw/*

echo "End time: $(date)"
echo "Elapsed time: $(date -ud "@$(($(date +%s)-start))" +'%H hr %M min %S sec')"
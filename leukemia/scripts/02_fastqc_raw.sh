#!/bin/bash
#SBATCH --job-name=02_fastqc-raw
#SBATCH -c 1
#SBATCH --mem=8G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH -o logs/%x_%A_%a.out
#SBATCH --array=1-11

hostname
echo "Start time: $(date)"

module load fastqc/0.12.1

metadata=../metadata.csv
indir=../results/01_download
outdir=../results/02_fastqc_raw

mkdir -p $outdir

# Get nth ID from the metadata file based on the SLURM array task ID and cut the first column of csv row
sample=$( awk "NR==${SLURM_ARRAY_TASK_ID}+1" $metadata | cut -d, -f2 )

# Run FastQC on sample files
fastqc --outdir $outdir $indir/${sample}_{1,2,3}.fastq.gz

echo "End time: $(date)"


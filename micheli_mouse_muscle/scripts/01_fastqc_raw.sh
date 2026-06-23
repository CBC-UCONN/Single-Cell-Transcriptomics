#!/bin/bash
#SBATCH --job-name=01_fastqc-raw
#SBATCH -c 1
#SBATCH --mem=8G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH -o logs/%x_%A_%a.out
#SBATCH --array=1-9

echo "Job running on: $(hostname)"
start=$(date +%s)
echo "Start time: $(date)"

module load fastqc/0.12.1

samples=../biosample.csv
indir=../raw_data
outdir=../results/01_fastqc_raw

mkdir -p $outdir

# Get the nth row of the 2nd column (Sample) from the biosample.csv file
sample=$( awk "NR==${SLURM_ARRAY_TASK_ID}+1" $samples | cut -d, -f2 )

# Run FastQC on sample files
fastqc --outdir $outdir $indir/${sample}_{1,2,3}.fastq.gz

echo "End time: $(date)"eecho "End time: $(date)"
echo "Elapsed time: $(date -ud "@$(($(date +%s)-start))" +'%H hr %M min %S sec')"

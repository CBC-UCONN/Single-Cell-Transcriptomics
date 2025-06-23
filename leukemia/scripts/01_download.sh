#!/bin/bash
#SBATCH --job-name=01_download
#SBATCH -c 6
#SBATCH --mem=8G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH -o logs/%x_%A_%a.out
#SBATCH --array=1-11

hostname
echo "Start time: $(date)"

module load sratoolkit/3.0.5

metadata=../metadata.csv
outdir=../results/01_download

mkdir -p $outdir

# Get nth ID from the metadata file based on the SLURM array task ID and cut the first column of csv row
sra=$( awk "NR==${SLURM_ARRAY_TASK_ID}+1" $metadata | cut -d, -f1 )

# Get nth ID from the metadata file based on the SLURM array task ID and cut the second column of csv row
sample=$( awk "NR==${SLURM_ARRAY_TASK_ID}+1" $metadata | cut -d, -f2 )

# Download
fasterq-dump $sra --threads 6 --split-files --include-technical --outdir $outdir

# # Compress the SRA file
gzip $outdir/${sra}_1.fastq 
gzip $outdir/${sra}_2.fastq 
gzip $outdir/${sra}_3.fastq 

# Rename files
mv $outdir/${sra}_1.fastq.gz $outdir/${sample}_1.fastq.gz 
mv $outdir/${sra}_2.fastq.gz $outdir/${sample}_2.fastq.gz 
mv $outdir/${sra}_3.fastq.gz $outdir/${sample}_3.fastq.gz 


echo "End time: $(date)"
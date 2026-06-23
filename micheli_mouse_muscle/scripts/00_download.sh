#!/bin/bash
#SBATCH --job-name=00_download
#SBATCH -c 6
#SBATCH --mem=32G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH -o logs/%x_%A_%a.out
#SBATCH --array=1-9


echo "Job running on: $(hostname)"
start=$(date +%s)
echo "Start time: $(date)"

module load sratoolkit/3.0.5

metadata=../metadata.csv
sample_data=../biosample.csv
outdir=../raw_data

mkdir -p $outdir

# Get the nth row of the "Run" column
sra=$(python3 -c "
import csv
n = $SLURM_ARRAY_TASK_ID
with open('$metadata') as f:
    reader = csv.DictReader(f)
    for i, row in enumerate(reader, 1):
        if i == n:
            print(row['Run'])
            break
")

# Get the nth row of the "Run" column
biosample=$(python3 -c "
import csv
n = $SLURM_ARRAY_TASK_ID
with open('$metadata') as f:
    reader = csv.DictReader(f)
    for i, row in enumerate(reader, 1):
        if i == n:
            print(row['Sample Name'])
            break
")

# Get sample name matching biosample id
sample=$(python3 -c "
import csv
with open('$sample_data') as f:
    reader = csv.DictReader(f)
    for row in reader:
        if row['Biosample'] == '$biosample':
            print(row['Sample'])
            break
")

# Download
# fasterq-dump $sra --threads 6 --split-files --include-technical --outdir $outdir
fasterq-dump $sra --threads 6 --split-files --outdir $outdir

# # # Compress the SRA file
# gzip $outdir/${sra}_1.fastq 
# gzip $outdir/${sra}_2.fastq 
# gzip $outdir/${sra}_3.fastq 

# # Rename files
# mv $outdir/${sra}_1.fastq.gz $outdir/${sample}_1.fastq.gz 
# mv $outdir/${sra}_2.fastq.gz $outdir/${sample}_2.fastq.gz 
# mv $outdir/${sra}_3.fastq.gz $outdir/${sample}_3.fastq.gz 

echo "End time: $(date)"
echo "Elapsed time: $(date -ud "@$(($(date +%s)-start))" +'%H hr %M min %S sec')"
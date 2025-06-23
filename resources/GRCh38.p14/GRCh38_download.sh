#!/bin/bash
#SBATCH --job-name=GRCh38_download
#SBATCH -c 1
#SBATCH --mem=8G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH -o logs/%x_%j.out

hostname
echo "Start time: $(date)"

module load NCBI_Datasets/v2

accession=GCF_000001405.40
genome=GRCh38.p14

datasets download genome accession $accession \
  --include gtf \
  --filename $genome.zip

  # --include genome,gtf,gff3 \
unzip $genome.zip -d $genome

mv $genome/ncbi_dataset/data/$accession/${accession}_${genome}_genomic.fna $genome.fna
mv $genome/ncbi_dataset/data/$accession/genomic.gtf $genome.gtf
mv $genome/ncbi_dataset/data/$accession/genomic.gff $genome.gff

rm -r $genome $genome.zip

echo "End time: $(date)"
#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=8
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=80g
#SBATCH --time=24:00:00
#SBATCH --job-name=samtools_hap1
#SBATCH --output=/share/BioinfMSc/rot3_group2/samtools/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rot3_group2/samtools/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxas26@exmail.nottingham.ac.uk

# source your bash profile so you can use conda
source $HOME/.bash_profile

# activate conda env with samtools installed
conda activate Samtools

# extract specific genomic region using samtools:
# faidx: Index and extract subsequences from FASTA
# uses input, specific genomic coordinates to extract, and output
samtools faidx /share/BioinfMSc/rot3_group2/C087_203_mapq_hap1_8.fa RL_5:16000000-23979000 > /share/BioinfMSc/rot3_group2/samtools/scaff5_hap1.fasta

# deactivate conda env
conda deactivate


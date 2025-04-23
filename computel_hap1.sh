#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=8
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=300g
#SBATCH --time=48:00:00
#SBATCH --job-name=computel_hap1
#SBATCH --output=/share/BioinfMSc/rot3_group2/computel/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rot3_group2/computel/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxas26@exmail.nottingham.ac.uk

source $HOME/.bash_profile

# Load Conda environment for Bowtie2 and Samtools
source /gpfs01/home/mbxas26/miniconda3/etc/profile.d/conda.sh
conda activate Bowtie2

# Ensure Bowtie2 and Samtools are in PATH
export PATH=$PATH:/gpfs01/home/mbxas26/miniconda3/envs/Bowtie2/bin/bowtie2-align-l
export PATH=$PATH:/gpfs01/home/mbxas26/miniconda3/envs/Samtools/bin
export PATH=$PATH:/gpfs01/home/mbxas26/miniconda3/envs/BowtieR/bin

# Go to the ComputeL directory
cd /share/BioinfMSc/rot3_group2/computel

# Run ComputeL with the appropriate arguments
./computel.sh -1 /share/BioinfMSc/rot3_group2/computel/hap1.fq -r /share/BioinfMSc/rot3_group2/computel/GCF_000001735.4_TAIR10.1_genomic.fna -p 4 -o /share/BioinfMSc/rot3_group2/computel/output/

# Deactivate Conda environment
conda deactivate

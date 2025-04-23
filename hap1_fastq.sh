#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=8
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=300g
#SBATCH --time=48:00:00
#SBATCH --job-name=seqtk_hap1
#SBATCH --output=/share/BioinfMSc/rot3_group2/computel/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rot3_group2/computel/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxas26@exmail.nottingham.ac.uk

# source your bash profile so you can use conda
source $HOME/.bash_profile

# activate conda env with seqtk installation
conda activate seqtk

# convert FASTA to FASTQ format, adding dummy quality scores 'I' (Phred+33 score 40)
# input: /share/BioinfMSc/rot3_group2/computel/C087_203_mapq_hap1_8.fa
# output: /share/BioinfMSc/rot3_group2/computel/hap1.fq
seqtk seq -F 'I' /share/BioinfMSc/rot3_group2/computel/C087_203_mapq_hap1_8.fa > /share/BioinfMSc/rot3_group2/computel/hap1.fq

# deactivate conda env
conda deactivate

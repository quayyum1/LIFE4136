#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=8
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=300g
#SBATCH --time=48:00:00
#SBATCH --job-name=barrnap_hap2
#SBATCH --output=/share/BioinfMSc/rot3_group2/barrnap/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rot3_group2/barrnap/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxas26@exmail.nottingham.ac.uk

# source your bash profile so you can use conda
source $HOME/.bash_profile

# activate conda env with barrnap installed
conda activate Barrnap

# predict rRNA genes in hap2 assembly using eukaryotic models
# outputs GFF3 annotations
barrnap --kingdom euk /share/BioinfMSc/rot3_group2/C087_203_mapq_hap2_8.fa > /share/BioinfMSc/rot3_group2/barrnap/barrnap_hap2.gff3

# deactivate conda env
conda deactivate

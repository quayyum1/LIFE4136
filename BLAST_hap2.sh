#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=8
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=80g
#SBATCH --time=48:00:00
#SBATCH --job-name=BLAST_hap2
#SBATCH --output=/share/BioinfMSc/rot3_group2/BLAST/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rot3_group2/BLAST/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxas26@exmail.nottingham.ac.uk

# source your bash profile so you can use conda
source $HOME/.bash_profile

# activate conda env with BLAST installed
conda activate BLAST

# create a BLAST nucleotide database from haplotype 2 assembly
# -dbtype: specify nucleotide database
# -in: input FASTA file
# -out: output database name/path
makeblastdb -dbtype nucl -in /share/BioinfMSc/rot3_group2/C087_203_mapq_hap2_8.fa -out /share/BioinfMSc/rot3_group2/BLAST/hap2_database

# deactivate conda env
conda deactivate

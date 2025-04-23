#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=8
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=80g
#SBATCH --time=24:00:00
#SBATCH --job-name=Augustus_hap2
#SBATCH --output=/share/BioinfMSc/rot3_group2/Augustus/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rot3_group2/Augustus/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxas26@exmail.nottingham.ac.uk

# source your bash profile so you can use conda
source $HOME/.bash_profile

# activate conda env with augustus installed
conda activate Augustus

# run Augustus gene prediction:
# --gff3=on: Output in GFF3 format
# --species=arabidopsis: Use Arabidopsis thaliana model
augustus --gff3=on --species=arabidopsis /share/BioinfMSc/rot3_group2/C087_203_mapq_hap2_8.fa > /share/BioinfMSc/rot3_group2/Augustus/hap2.gff

# deactivate conda env
conda deactivate

#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=48
#SBATCH --mem=80g
#SBATCH --time=48:00:00
#SBATCH --job-name=OrthoFinder_hap1
#SBATCH --output=/share/BioinfMSc/rot3_group2/OrthoFinder/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rot3_group2/OrthoFinder/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxas26@exmail.nottingham.ac.uk

# source your bash profile so you can use conda
source $HOME/.bash_profile

# activate conda env that has orthofinder installed
conda activate OrthoFinder

# run OrthoFinder with parameters:
# -f: Input directory containing FASTA files
# -d: Input files are in protein format
# -t: Threads (45)
orthofinder -f /share/BioinfMSc/rot3_group2/OrthoFinder/ -d -t 45 

# deactivate conda env
conda deactivate




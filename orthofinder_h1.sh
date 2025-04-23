#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=60
#SBATCH --mem=80g
#SBATCH --time=72:00:00
#SBATCH --job-name=Q_OrthoFinder_hap1
#SBATCH --output=/share/BioinfMSc/rot3_group2/Q_Orthofinder/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rot3_group2/Q_OrthoFinder/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxqa5@nottingham.ac.uk

# source your bash profile so you can use conda
source $HOME/.bash_profile

# activate conda env with orthofinder installed
conda activate orthofinder

# loop through *.fa files
for f in *fa ; do python ~/share/BioinfMSc/rot3_group2/Q_Orthofinder/OrthoFinder/tools/primary_transcript.py $f ; done  #extract just the longest transcript variant per gene and run OrthoFinder

# -f: Input directory containing FASTA files
# -d: Only perform DIAMOND searches
# -t 60: Use 60 CPU threads
orthofinder -f /share/BioinfMSc/rot3_group2/Q_Orthofinder/hap1hap2 -d -t 60 

# deactivate conda env
conda deactivate

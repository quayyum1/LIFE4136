#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=8
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=300g
#SBATCH --time=01:00:00
#SBATCH --job-name=ModDotPlot
#SBATCH --output=/share/BioinfMSc/rot3_group2/ModDotPlot/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rot3_group2/ModDotPlot/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxas26@exmail.nottingham.ac.uk

# source your bash profile so you can use conda
source $HOME/.bash_profile

# activate conda env with moddotplot installed
conda activate Python

# generate static moddotplot of haplotype 1 and 2
moddotplot static -f /share/BioinfMSc/rot3_group2/C087_203_mapq_hap1_8.fa -o /share/BioinfMSc/rot3_group2/ModDotPlot/ModDotPlot_hap1
moddotplot static -f /share/BioinfMSc/rot3_group2/C087_203_mapq_hap2_8.fa -o /share/BioinfMSc/rot3_group2/ModDotPlot/ModDotPlot_hap2

# deactivate conda env
conda deactivate

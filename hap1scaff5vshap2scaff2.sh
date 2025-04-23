#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=50G
#SBATCH --time=24:00:00
#SBATCH --job-name=moddotplot_hap1vshap2
#SBATCH --output=/share/BioinfMSc/rot3_group2/ModDotPlot/logs/moddotplot.out
#SBATCH --error=/share/BioinfMSc/rot3_group2/ModDotPlot/logs/moddotplot.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxas26@nottingham.ac.uk

# source your bash profile so you can use conda
source $HOME/.bash_profile

# activate the conda env that moddotplot is installed
conda activate Python

# run on static mode using BED file 
moddotplot static -b /share/BioinfMSc/rot3_group2/alignment/hap1_hap2_fixed.bed -o /share/BioinfMSc/rot3_group2/ModDotPlot/hap1scaf5vshap2scaf2

# deactivate conda env
conda deactivate


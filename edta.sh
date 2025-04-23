#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=100g
#SBATCH --time=48:00:00
#SBATCH --job-name=edta2
#SBATCH --output=/share/BioinfMSc/rot3_group2/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rot3_group2/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxqa5@nottingham.ac.uk

# source your bash profile so you can use conda
source $HOME/.bash_profile

# change to working directory
cd /share/BioinfMSc/rot3_group2/EDTA/hap2

# activate conda env with EDTA installed
conda activate EDTA

# run EDTA transposon annotation:
# --genome: Input genome assembly
# --threads 32: Use 32 CPU threads
# --anno 1: Perform full annotation
EDTA.pl --genome /share/BioinfMSc/rot3_group2/C087_203_mapq_hap2_8.fa  --threads 32 --anno 1

# deactivate conda env
conda deactivate

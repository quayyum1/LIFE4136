#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=100g
#SBATCH --time=72:00:00
#SBATCH --job-name=edta2
#SBATCH --output=/share/BioinfMSc/rot3_group2/Q_ModDotPlot/ModDotPlot/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rot3_group2/Q_ModDotPlot/ModDotPlot/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxqa5@nottingham.ac.uk

# source your bash profile so you can use conda
source $HOME/.bash_profile

# change to working directory
cd /share/BioinfMSc/rot3_group2/Q_ModDotPlot/ModDotPlot/hap1_vs_hap2

# activate conda env with moddotplot installed
conda activate python

# run moddotplot in interactive mode to compare scaffold 5 from hap1 with scaffold 2 from hap2
# --compare-only: only show comparison view
# --port: specify port for interactive visualization
moddotplot interactive -f /share/BioinfMSc/rot3_group2/samtools/scaff5_hap1.fasta /share/BioinfMSc/rot3_group2/samtools/scaff2_hap2.fasta --compare-only --port 8888

# deactivate conda env
conda deactivate


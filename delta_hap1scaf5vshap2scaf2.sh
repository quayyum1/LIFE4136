#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=50G
#SBATCH --time=24:00:00
#SBATCH --job-name=nucmer_hap1vshap2.delta
#SBATCH --output=/share/BioinfMSc/rot3_group2/alignment/logs/nucmerdelta.out
#SBATCH --error=/share/BioinfMSc/rot3_group2/alignment/logs/nucmerdelta.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxas26@nottingham.ac.uk

# source your bash profile so you can use conda
source $HOME/.bash_profile

# activate conda env with MUMmer installed
conda activate mummer

# process NUCmer alignment results:
# -r: Sort by reference coordinates
# -c: Include coverage information
# -l: Include sequence lengths
# -T: Tab-delimited output
# -H: Suppress header line
show-coords -rclTH /share/BioinfMSc/rot3_group2/alignment/hap1_hap2.delta > /share/BioinfMSc/rot3_group2/alignment/hap1_hap2.coords

# deactivate conda env
conda deactivate

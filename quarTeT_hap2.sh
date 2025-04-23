#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=8
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=80g
#SBATCH --time=00:01:00
#SBATCH --job-name=quarTeT_hap2
#SBATCH --output=/share/BioinfMSc/rot3_group2/quarTet/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rot3_group2/quarTet/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxas26@exmail.nottingham.ac.uk

# source your bash profile so you can use conda
source $HOME/.bash_profile

# activate conda env with quertet installed
conda activate quarTeTdependencies

# chnage to installatino directory
cd /share/BioinfMSc/rot3_group2/quarTet/quarTeT

# run quartet to identify telomeric repeats
# -i: input FASTA file
# -c: specify organism type (plant)
# -m: minimum repeat length
# -p: output prefix
python3 quartet.py TeloExplorer -i /share/BioinfMSc/rot3_group2/C087_203_mapq_hap2_8.fa -c plant -m 100 -p hap2.telo

# deactivate conda env
conda deactivate

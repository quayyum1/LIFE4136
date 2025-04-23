#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=100g
#SBATCH --time=48:00:00
#SBATCH --job-name=centroQuarTeT
#SBATCH --output=/share/BioinfMSc/rot3_group2/centro_quarTet/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rot3_group2/centro_quarTet/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxqa5@nottingham.ac.uk

# source your bash profile so you can use conda
source $HOME/.bash_profile

# set the directory that the task will run on
cd /share/BioinfMSc/rot3_group2/centro_quarTet/quarTeT

# activate conda env with quartet installed for TE analysis
conda activate quarTeTdependencies

# run quarTeT CentroMiner module to identify centromeric repeats:
# -i: Input assembly (hap2)
# --TE: TE annotations from EDTA
# -t: Threads (32)
# -p: Output prefix
python3 quartet.py CentroMiner -i /share/BioinfMSc/rot3_group2/C087_203_mapq_hap2_8.fa\
  --TE /share/BioinfMSc/rot3_group2/EDTA/hap2/C087_203_mapq_hap2_8.fa.mod.EDTA.TEanno.gff3\
  -t 32 -p hap2

# deactivate conda env
conda deactivate

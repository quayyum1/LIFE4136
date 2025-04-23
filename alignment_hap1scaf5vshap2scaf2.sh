#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=50G
#SBATCH --time=24:00:00
#SBATCH --job-name=nucmer_hap1scaf5_vs_hap2scaf2
#SBATCH --output=/share/BioinfMSc/rot3_group2/alignment/logs/nucmer.out
#SBATCH --error=/share/BioinfMSc/rot3_group2/alignment/logs/nucmer.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxas26@nottingham.ac.uk

# source your bash profile so you can use conda
source $HOME/.bash_profile

# activate conda env with MUMmer installed
conda activate mummer

# Run NUCmer genome alignment:
# --maxmatch: Report all matches regardless of uniqueness
# -c 100: Minimum cluster length
# -l 50: Minimum match length
# -p: Output prefix for result files
nucmer --maxmatch -c 100 -l 50 /share/BioinfMSc/rot3_group2/samtools/scaff5_hap1.fasta  /share/BioinfMSc/rot3_group2/samtools/scaff2_hap2.fasta -p hap1_hap2

# deactivate conda env
conda deactivate


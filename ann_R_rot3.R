# Check if rtracklayer package is installed, if not install it via BiocManager
if (!requireNamespace("rtracklayer", quietly = TRUE)) {
  install.packages("BiocManager")
  BiocManager::install("rtracklayer")
}

# Load required libraries for genomic data handling and visualization
library(rtracklayer)  # For importing GFF files
library(ggplot2)      # For creating plots

# Import GFF annotation files for both haplotypes
hap1 <- import("hap1.gff")  # Load haplotype 1 gene annotations
hap2 <- import("hap2.gff")  # Load haplotype 2 gene annotations

# Extract only gene features from each GFF file
hap1_genes <- hap1[hap1$type == "gene"]  # Filter for gene features in hap1
hap2_genes <- hap2[hap2$type == "gene"]  # Filter for gene features in hap2

# Calculate gene lengths (in base pairs) for both haplotypes
hap1_lengths <- width(hap1_genes)  # Get lengths of all genes in hap1
hap2_lengths <- width(hap2_genes)  # Get lengths of all genes in hap2

# Create a data frame combining gene lengths from both haplotypes
df <- data.frame(
  length = c(hap1_lengths, hap2_lengths),  # Combine length measurements
  haplotype = c(rep("hap1", length(hap1_lengths)),  # Label hap1 data
               rep("hap2", length(hap2_lengths)))   # Label hap2 data

# Create and save a histogram of gene length distribution
ggplot(df, aes(x = length, fill = haplotype)) +
  geom_histogram(alpha = 0.6, bins = 100, position = "identity") +  # Overlaid histograms
  labs(
    title = "Gene Length Distribution in hap1 and hap2",
    x = "Gene Length (bp)", y = "Frequency"
  ) 

# Save the plot as a PNG file
ggsave("gene_length_distribution.png", width = 10, height = 6, dpi = 300)

# Create a new data frame with log10-transformed gene lengths
df <- data.frame(
  length = c(hap1_lengths, hap2_lengths),
  haplotype = c(rep("hap1", length(hap1_lengths)), rep("hap2", length(hap2_lengths)))
)
df$log_length <- log10(df$length)  # Add log10-transformed length column

# Create and save a log-scale version with density curves
ggplot(df, aes(x = log_length, fill = haplotype, color = haplotype)) +
  geom_histogram(aes(y = after_stat(density)), bins = 100, alpha = 0.4, position = "identity") +
  geom_density(linewidth = 1.2, adjust = 1.5) +  # Add smoothed density curves
  labs(
    title = "Log10 Gene Length Distribution with Density Curve",
    x = "log10(Gene Length in bp)", y = "Density"
  ) +
  scale_fill_manual(values = c("steelblue", "darkorange")) +  # Custom fill colors
  scale_color_manual(values = c("steelblue", "darkorange"))   # Custom line colors

# Save the log-scale plot
ggsave("gene_length_log10_density.png", width = 10, height = 6, dpi = 300)

# Load BLASTn identity score data from text files
hap1 <- scan("hap1_identity.txt")  # Load hap1 BLAST identity scores
hap2 <- scan("hap2_identity.txt")  # Load hap2 BLAST identity scores

# Create data frame for BLAST identity scores
df_BLAST <- data.frame(
  identity = c(hap1, hap2),  # Combine identity scores
  haplotype = c(rep("hap1", length(hap1)),  # Label hap1 scores
               rep("hap2", length(hap2)))   # Label hap2 scores

# Create and customize histogram of BLAST identity scores
ggplot(df_BLAST, aes(x = identity, fill = haplotype)) +
  geom_histogram(binwidth = 0.5, position = "identity", alpha = 0.5) +  # Overlaid histograms
  labs(title = "Distribution of BLASTn identity scores",
       x = "Identity (%)", y = "Count") +
  scale_fill_manual(values = c("steelblue", "darkorange")) +  # Custom colors
  scale_x_continuous(limits = c(90, 100)) +  # Set x-axis limits (90-100%)
  geom_density(alpha = 0.2, adjust = 1.2)    # Add density curves
# LIFE4136 - Haplome Annotation and Comparison Project

## Table of Contents

1. Project Overview
2. Installation and Requirements
3. Usage Examples
4. Tools Used
5. Contributors

---

## Project Overview

This project focuses on the annotation and comparative analysis of two haplomes (Arenosa and Lyrata) from polyploid Arabidopsis species.



Key biological questions addressed:

- Characterisation of hybrid genomes compared to pure species
- Analysis of allele frequency spectra to determine ploidy patterns
- Investigation of diversity metrics and selection signatures
- Assessment of genetic linkage and potential bottlenecks in hybrids

---

## Installation and Requirements

### Dependencies

- Python 3.7+

- R 4.0+ with packages: `adegenet`, `vcfR`, `ggplot2`

- Tools: `samtools`, `Augustus`, `barrnap`, `EDTA`, `TRASH`, `ModDotPlot`, `Orthofinder`, `quarTet`, `computel`



### Installation

see "Installation Instructions" document for installation

---

## Usage Examples

Run gene prediction:

```
augustus --species=arabidopsis genome.fa > genes.gff
```



Perform orthogroup inference:

```
orthofinder -f proteomes/ -t 16
```



Generate dot plots:

```
ModDotPlot genome1.fa genome2.fa -o comparison.png
```



More instructions and scripts for running annotation, BLAST comparisons, dotplots, and structure analysis are included in the `scripts/` folder.

---

## Tools Used

| Tool             | Purpose                                         |
| ---------------- | ----------------------------------------------- |
| `Augustus`       | Gene prediction and annotation                  |
| `barrnap`        | Ribosomal RNA prediction                        |
| `EDTA`           | Transposable element annotation                 |
| `TRASH`          | Tandem repeat annotation                        |
| `centro_quartet` | Centromere analysis                             |
| `computel`       | Telomere length estimation                      |
| `samtools`       | General-purpose VCF/BAM handling                |
| `ModDotPlot`     | Visualization of synteny and structural changes |
| `Orthofinder`    | Ortholog inference across genomes               |
| `quarTet`        | Comparative phylogeny analysis                  |
| `BLAST`          | Sequence similarity search                      |

---

## Contributors

- **Quayyum Abdullahi**, University of Nottingham
- **Areeba Salman**, University of Nottingham
- **Junfang Hu**, University of Nottingham


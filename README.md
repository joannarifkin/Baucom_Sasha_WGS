# Baucom_Sasha_WGS
Scripts for analysis of Sasha's dissertation WGS sequence

## SNP_calling/
Scripts to QC (FastQC), adapter-trim (Trim_galore), and align (bwa_mem) reads, to index and call SNPs (mpileup) from alignment files, and to filter raw VCFs for depth, quality, missingness, and allele frequency.

##selection/
Scripts to convert input data using PGDSpider and run selection analyses using BayeScan 2.1 and bayenv.

##Phasing/
Scripts and notes to phase SNPs using beagle

##LD/

Scripts to prune LD using plink and estimate LD using []
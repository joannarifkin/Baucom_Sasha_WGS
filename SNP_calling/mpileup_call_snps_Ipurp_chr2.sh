#!/bin/bash

#SBATCH --account=rsbaucom1
#SBATCH --job-name=call_SNPs_Sasha_Ipurp_chr2
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=16
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=8GB
#SBATCH --time=3-00:00
#SBATCH --output=mpileup_Ipurp_chr2-%A-%a.log
#SBATCH --error=mpileup_error_Ipurp_chr2-%A-%a.log
#SBATCH --partition=standard


#Use either the Baucom lab bcftools module, with version 1.16, or the GL one, with version 1.12
module purge
module use /nfs/turbo/rsbaucom/lab/Lmod
module load bcftools_module
module list
export BCFTOOLS_PLUGINS=/nfs/turbo/rsbaucom/lab/SOFTWARE/bcftools/plugins

#module purge
#module load Bioinformatics
#module load Bioinformatics gcc/10.3.0-k2osx5y
#module load bcftools/1.12-g4b275e
#module list

bcftools mpileup -r Ipurp_chr2 --threads 16 -a AD,DP -Ou --max-depth 2000 -f /nfs/turbo/rsbaucom/lab/IP_genome_COGE/Ipomoea_purpurea_headings_fixed.faa  \
-b /gpfs/accounts/rsbaucom_root/rsbaucom0/jlrifkin/IP_WGS_intermediates/Alignment/bam_list.txt | bcftools call --threads 16 -mv -O z -f gq -o raw_Ipomoea_call_SNPs_Sasha_Ipurp_chr2_2-16-2023.vcf.gz 


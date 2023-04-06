#!/bin/bash

#SBATCH --account=rsbaucom1
#SBATCH --job-name=phase_SNPs_Sasha_Ipurp_chrs
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=16
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=96GB
#SBATCH --time=1-00:00
#SBATCH --output=phase_Ipurp_chrs-%A-%a.log
#SBATCH --error=phase_error_Ipurp_chrs-%A-%a.log
#SBATCH --partition=standard

for i in {2..15}
do

java -jar /nfs/turbo/rsbaucom/lab/SOFTWARE/beagle.22Jul22.46e.jar nthreads=16 gt=/nfs/turbo/rsbaucom/lab/IP_WGS_Sasha/vcf/filter/Sasha_Ipurp_chr$i\_maf0.02_miss0.9_q30_dp10.100_filtered.vcf.gz out=Sasha_Ipurp_chr$i\_maf0.02_miss0.9_q30_dp10.100_filtered_phased 

done
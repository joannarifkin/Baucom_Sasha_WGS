#!/bin/bash

#SBATCH --account=rsbaucom1
#SBATCH --job-name=PGDconvert2003_5-17-2023
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=30GB
#SBATCH --time=1-00:00
#SBATCH --output=PGDconvert2003-%A-%a.log
#SBATCH --error=PGDconvert2003-%A-%a.log
#SBATCH --partition=standard



java -jar -Xmx30g -Xms5g /nfs/turbo/rsbaucom/lab/SOFTWARE/PGDSpider_2.1.1.5/PGDSpider2-cli.jar -spid Ipomoea_WGS_vcf_bayenv.spid -inputfile  /nfs/turbo/rsbaucom/lab/IP_WGS_Sasha/vcf/phased/LD_pruned/Sasha_Ipurp_ALL_maf0.02_miss0.9_q30_dp10.100_filtered_phased_LD_pruned.vcf -inputformat VCF -outputfile all_LD_pruned_bayescan -od BayeScan2_2003_out -outputformat GESTE_BAYE_SCAN 

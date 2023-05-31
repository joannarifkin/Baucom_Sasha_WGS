#!/bin/bash

#SBATCH --account=rsbaucom1
#SBATCH --job-name=convert_test
#SBATCH --cpus-per-task=16
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=20GB
#SBATCH --time=1-00:00
#SBATCH --output=convert_test.log
#SBATCH --partition=standard

java -Xmx18g -Xms512m -jar /nfs/turbo/rsbaucom/lab/SOFTWARE/PGDSpider_2.1.1.5/PGDSpider2-cli.jar  -inputfile /nfs/turbo/rsbaucom/lab/IP_WGS_Sasha/vcf/phased/LD_pruned/Sasha_Ipurp_ALL_maf0.02_miss0.9_q30_dp10.100_filtered_phased_LD_pruned.vcf -inputformat VCF -outputfile Sasha_Ipurp_ALL_maf0.02_miss0.9_q30_dp10.100_filtered_phased_LD_pruned -outputformat BAYENV -spid convert_vcf_bayenv.spid
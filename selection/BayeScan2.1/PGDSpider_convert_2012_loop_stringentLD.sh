#!/bin/bash

#SBATCH --account=rsbaucom1
#SBATCH --job-name=PGDconvert2012_8-11-2023
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=6GB
#SBATCH --time=1-00:00
#SBATCH --output=PGDconvert2012_loop-%A-%a.log
#SBATCH --error=PGDconvert2012_loop-%A-%a.log
#SBATCH --partition=standard

for i in {1..16} 

do

java -jar -Xmx6g -Xms1g /nfs/turbo/rsbaucom/lab/SOFTWARE/PGDSpider_2.1.1.5/PGDSpider2-cli.jar -spid spids_2012/convert_vcf_bayescan2_chr$i\_2012.spid -inputfile /nfs/turbo/rsbaucom/lab/IP_WGS_Sasha/vcf/phased/LD_pruned/pruned_500kb_0.2/Sasha_Ipurp_ALL_maf0.02_miss0.9_q30_dp10.100_filtered_phased_500kb_0.2_LD_pruned.vcf -inputformat VCF -outputfile BayeScan2_2012_stringentLD_out/chr$i\_2012_LD_pruned_bayescan  -outputformat GESTE_BAYE_SCAN 

done
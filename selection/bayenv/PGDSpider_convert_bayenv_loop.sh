#!/bin/bash

#SBATCH --account=rsbaucom1
#SBATCH --job-name=PGDconvert_bayenv_5-31-2023
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=6GB
#SBATCH --time=1-00:00
#SBATCH --output=PGDconvert_bayenv-%A-%a.log
#SBATCH --error=PGDconvert_bayenv-%A-%a.log
#SBATCH --partition=standard

for i in {1..16}

do

java -jar -Xmx6g -Xms1g /nfs/turbo/rsbaucom/lab/SOFTWARE/PGDSpider_2.1.1.5/PGDSpider2-cli.jar -spid ../spids/chr$i\_bayenv_spid.spid -inputfile  /nfs/turbo/rsbaucom/lab/IP_WGS_Sasha/vcf/phased/LD_pruned/Sasha_Ipurp_ALL_maf0.02_miss0.9_q30_dp10.100_filtered_phased_LD_pruned.vcf -inputformat VCF -outputfile chr$i\_LD_pruned_bayenv -od . -outputformat BAYENV 

done
#!/bin/bash

#SBATCH --account=rsbaucom1
#SBATCH --job-name=prune_Sasha
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=16
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=96GB
#SBATCH --time=5-00:00
#SBATCH --output=prune_Sasha-%A-%a.log
#SBATCH --partition=standard

module load Bioinformatics
module load plink/2.4a4

plink2 --allow-extra-chr --set-all-var-ids @:#\$r,\$a --indep-pairwise 200kb 0.5 --vcf /nfs/turbo/rsbaucom/lab/IP_WGS_Sasha/vcf/phased/Sasha_Ipurp_ALL_maf0.02_miss0.9_q30_dp10.100_filtered_phased.vcf.gz
#!/bin/bash

#SBATCH --account=rsbaucom1
#SBATCH --job-name=Sasha_GWAS
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=16GB
#SBATCH --time=3-00:00
#SBATCH --output=Sasha_GWAS-%A-%a.log
#SBATCH --error=Sasha_GWAS_error-%A-%a.log
#SBATCH --partition=standard

module purge
module use /nfs/turbo/rsbaucom/lab/Lmod #To use the Baucom lab version, use these lines. To use a local version you add to your path, omit them.
module load gemma_module
module list

gemma -bfile Sasha_Ipurp_all_filtered_phased_2012_corolla -k output/Sasha_Ipurp_all_filtered_phased_2012_corolla.cXX.txt -lmm 4 -o Sasha_Ipurp_all_filtered_phased_2012_corolla
gemma -bfile Sasha_Ipurp_all_filtered_phased_2003_nectar -k output/Sasha_Ipurp_all_filtered_phased_2003_nectar.cXX.txt -lmm 4 -o Sasha_Ipurp_all_filtered_phased_2003_nectar
gemma -bfile Sasha_Ipurp_all_filtered_phased_2012_nectar -k output/Sasha_Ipurp_all_filtered_phased_2012_corolla.cXX.txt -lmm 4 -o Sasha_Ipurp_all_filtered_phased_2012_nectar
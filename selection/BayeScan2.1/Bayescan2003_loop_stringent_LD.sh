#!/bin/bash

#SBATCH --account=rsbaucom1
#SBATCH --job-name=BayeScan2003_8-11-2023
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=96GB
#SBATCH --time=8-00:00
#SBATCH --output=BayeScan2003_loop-%A-%a.log
#SBATCH --error=BayeScan2003_loop-%A-%a.log
#SBATCH --partition=standard

for i in {1..16} 

do

/nfs/turbo/rsbaucom/lab/SOFTWARE/BayeScan2.1/source/bayescan_2.1 chr$i\_2003_LD_pruned_bayescan  -pr_odds 10000 -threads 16 -o chr$i\_2003_LD_pruned_bayescan -od .    

done
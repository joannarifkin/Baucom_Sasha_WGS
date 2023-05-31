#!/bin/bash

#SBATCH --account=rsbaucom1
#SBATCH --job-name=matrix_est_bayenv_5-31-2023
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=6GB
#SBATCH --time=1-00:00
#SBATCH --output=matrix_est_bayenv-%A-%a.log
#SBATCH --error=matrix_est_bayenv-%A-%a.log
#SBATCH --partition=standard



export PATH="/nfs/turbo/rsbaucom/lab/SOFTWARE/bayenv2:$PATH" 

for i in {1..16}

do
bayenv2 -i chr$i\_LD_pruned_bayenv -p 16 -k 100000 -r 83556 > chr$i\_matrix.tmp

tail -17 chr$i\_matrix.tmp > chr_$i\_matrix.out

done

rm *matrix.tmp

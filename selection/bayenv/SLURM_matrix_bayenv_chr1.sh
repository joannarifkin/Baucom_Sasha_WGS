#!/bin/bash

#SBATCH --account=rsbaucom1
#SBATCH --job-name=matrix_est_bayenv_5-24-2023
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

bayenv2 -i chr1_LD_pruned_bayenv -p 16 -k 100000 -r 83556 > chr1_matrix.out


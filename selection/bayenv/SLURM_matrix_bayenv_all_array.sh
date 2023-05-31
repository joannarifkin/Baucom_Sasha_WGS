#!/bin/bash

#SBATCH --account=rsbaucom1
#SBATCH --job-name=matrix_est_bayenv_5-31-2023
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=6GB
#SBATCH --time=4-00:00
#SBATCH --output=matrix_est_bayenv-%A-%a.log
#SBATCH --error=matrix_est_bayenv-%A-%a.log
#SBATCH --partition=standard
#SBATCH --array=1-16



export PATH="/nfs/turbo/rsbaucom/lab/SOFTWARE/bayenv2:$PATH" 

bayenv2 -i chr$SLURM_ARRAY_TASK_ID\_LD_pruned_bayenv -p 16 -k 100000 -r 83556 > chr$SLURM_ARRAY_TASK_ID\_matrix.tmp

tail -17 chr$SLURM_ARRAY_TASK_ID\_matrix.tmp > chr_$SLURM_ARRAY_TASK_ID\_matrix.out

rm chr$SLURM_ARRAY_TASK_ID\_matrix.tmp

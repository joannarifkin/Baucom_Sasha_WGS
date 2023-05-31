#!/bin/bash

#SBATCH --account=rsbaucom1
#SBATCH --job-name=bfs_est_bayenv_5-25-2023
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=10GB
#SBATCH --time=1-00:00
#SBATCH --output=bfs_est_bayenv-%A-%a.log
#SBATCH --error=bfs_est_bayenv-%A-%a.log
#SBATCH --partition=standard



export PATH="/nfs/turbo/rsbaucom/lab/SOFTWARE/bayenv2:$PATH" 

#bayenv2 -i chr1_LD_pruned_bayenv -p 16 -k 100000 -r 83556 > chr1_matrix.out

calc_bf.sh /nfs/turbo/rsbaucom/lab/IP_WGS_Sasha/bayenv/mini_snp_file /nfs/turbo/rsbaucom/lab/IP_WGS_Sasha/bayenv/environ_file.txt /nfs/turbo/rsbaucom/lab/IP_WGS_Sasha/bayenv/chr1_matrix.out 16 2000 3


#/bayenv2 -i SNPFILE -m MATRIXFILE -e ENVIRONFILE -p NUMPOPS -k 100000 -n 1 -t -c -r 24542



#split -a 10 -l 2 mini_snp_file snp_batch

for f in $(ls snp_batch*)
do
bayenv2 -i $f -e environ_file.txt -m chr1_matrix.out -k 2000 -r 24542 -p 16 -n 3 -t -c
done

#rm -f snp_batch*


#sh /nfs/turbo/rsbaucom/lab/SOFTWARE/bayenv2/calc_bf.sh
##sh /nfs/turbo/rsbaucom/lab/SOFTWARE/bayenv2/calc_bf_rho.sh
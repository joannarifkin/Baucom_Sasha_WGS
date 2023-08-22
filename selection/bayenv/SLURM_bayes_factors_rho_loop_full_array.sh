#!/bin/bash

#SBATCH --account=rsbaucom1
#SBATCH --job-name=bfs_est_bayenv_7-6-2023
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --nodes=1
#SBATCH --cpus-per-task=36
#SBATCH --mem=10GB
#SBATCH --time=14-00:00
#SBATCH --output=bfs_est_array_bayenv-%A-%a.log
#SBATCH --error=bfs_est_array_bayenv-%A-%a.log
#SBATCH --partition=standard
#SBATCH --array=1-6


export PATH="/nfs/turbo/rsbaucom/lab/SOFTWARE/bayenv2:$PATH" 

c=${SLURM_ARRAY_TASK_ID}

echo $c
#for c in {1..16}

#do 

split -a 10 -l 2 chr$c\_LD_pruned_bayenv mini_chr $c\_snp_batch

for f in $(ls $c\_snp_batch*)

do

echo $f

#bayenv2 -i $f -m ../chr_$c\_matrix.out -e /nfs/turbo/rsbaucom/lab/IP_WGS_Sasha/bayenv/environ_file.txt -p 16 -k 100000 -n 3 -t -r 429 -X -c -o test.out #STILL works 

bayenv2 -i $f -m ../chr_$c\_matrix.out -e /nfs/turbo/rsbaucom/lab/IP_WGS_Sasha/bayenv/environ_file.txt -p 16 -k 100000 -n 3 -t -r 429 -X -c -o chr_$c.out #STILL works 


#rm -f snp_batch*

done

rm $c\_snp_batch*

#done

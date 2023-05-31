#!/bin/bash

#SBATCH --account=rsbaucom1
#SBATCH --job-name=test_LDHAT
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=2
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=16GB
#SBATCH --time=3-00:00
#SBATCH --output=test_LDHAT-%A-%a.log
#SBATCH --error=test_LDHAT-%A-%a.log
#SBATCH --partition=standard

/nfs/turbo/rsbaucom/lab/SOFTWARE/LDhat/pairwise -seq chr_14_2016.ldhat.sites -loc chr_14_2016.ldhat.locs -lk ../lk_n50_t0.1 &
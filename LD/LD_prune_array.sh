#!/bin/bash

#SBATCH --account=rsbaucom1
#SBATCH --job-name=index_Sasha
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=16
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=20GB
#SBATCH --time=5-00:00
#SBATCH --output=index_Sasha-%A-%a.log
#SBATCH --partition=standard
#SBATCH --array=1-94%25
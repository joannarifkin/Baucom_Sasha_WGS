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


module purge
module load Bioinformatics
module load Bioinformatics  gcc/10.3.0-k2osx5y
module load samtools/1.13-fwwss5n
module list

file=$(ls /gpfs/accounts/rsbaucom_root/rsbaucom0/jlrifkin/IP_WGS_intermediates/Alignment/*bam | sed -n ${SLURM_ARRAY_TASK_ID}p)
#unpaired=${file%_R1_001_val_1.fq.gz}
#samplename=${unpaired#*/scratch/rsbaucom_root/rsbaucom0/jlrifkin/IP_WGS_intermediates/Trim_galore/}

echo $file
#echo $unpaired\_R1_001_val_1.fq.gz
#echo $unpaired\_R2_001_val_2.fq.gz
#echo $samplename
#echo $samplename\_R1_001_val_1.fq.gz
#echo $samplename\_R2_001_val_2.fq.gz

samtools index -@ 4 $file
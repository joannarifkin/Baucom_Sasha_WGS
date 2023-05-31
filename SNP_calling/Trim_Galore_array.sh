#!/bin/bash

#SBATCH --account=rsbaucom1
#SBATCH --job-name=Trim_galore_Rifkin
#SBATCH --mail-user=#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=4 
#SBATCH --nodes=1
#SBATCH --mem=12GB 
#SBATCH --time=1-00:00
#SBATCH --partition=standard
#SBATCH --output=Trim_galore-%A-%a.log
#SBATCH --array=1-94%25

module purge
module load Bioinformatics
module load Bioinformatics  gcc/10.3.0-k2osx5y
module load trimgalore
module list
mkdir -p ./Trim_galore/
file=$(ls *R1*.fastq.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
echo $file
samplename=${file%*_R1_*.fastq.gz}
echo $samplename

trim_galore --fastqc -q 20 --paired --output_dir /scratch/rsbaucom_root/rsbaucom0/jlrifkin/IP_WGS_intermediates/Trim_galore --cores 4 $samplename\_R1_001.fastq.gz $samplename\_R2_001.fastq.gz
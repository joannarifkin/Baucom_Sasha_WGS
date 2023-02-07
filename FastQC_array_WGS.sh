#!/bin/bash


#SBATCH --account=rsbaucom0
#SBATCH --job-name=FastQC_WGS
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=16
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=32GB
#SBATCH --time=2-00:00
#SBATCH --partition=standard
#SBATCH --output=FastQC-%A-%a.log
#SBATCH --array=1-188

module purge
module load Bioinformatics
module load Bioinformatics  gcc/10.3.0-k2osx5y
module load fastqc/0.11.9-p6ckgle
module list

cd /nfs/turbo/rsbaucom/lab/IP_WGS_Sasha/fastqs_7570-SB

mkdir -p ./FastQC/
file=$(ls ./*.fastq.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
fastqc -o ./FastQC/ $file

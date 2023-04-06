#!/bin/bash

#SBATCH --account=rsbaucom1
#SBATCH --job-name=bwa_mem_Sasha
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=16
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=110GB
#SBATCH --time=5-00:00
#SBATCH --output=bwa_mem_Sasha-%A-%a.log
#SBATCH --partition=standard
#SBATCH --array=1-94%25


module purge
module load Bioinformatics
module load Bioinformatics  gcc/10.3.0-k2osx5y
module load bwa/0.7.17-mil4ns7
module load samtools/1.13-fwwss5n
module list

file=$(ls /scratch/rsbaucom_root/rsbaucom0/jlrifkin/IP_WGS_intermediates/Trim_galore/*R1*.fq.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
unpaired=${file%_R1_001_val_1.fq.gz}
samplename=${unpaired#*/scratch/rsbaucom_root/rsbaucom0/jlrifkin/IP_WGS_intermediates/Trim_galore/}

echo $file
echo $unpaired\_R1_001_val_1.fq.gz
echo $unpaired\_R2_001_val_2.fq.gz
echo $samplename
echo $samplename\_R1_001_val_1.fq.gz
echo $samplename\_R2_001_val_2.fq.gz

bwa mem /nfs/turbo/rsbaucom/lab/IP_genome_COGE/Ipomoea_purpurea_headings_fixed.faa \
  -t 16 \
  $unpaired\_R1_001_val_1.fq.gz \
  $unpaired\_R2_001_val_2.fq.gz | \
  samtools sort -@16 -o /scratch/rsbaucom_root/rsbaucom0/jlrifkin/IP_WGS_intermediates/Alignment/$samplename.bam

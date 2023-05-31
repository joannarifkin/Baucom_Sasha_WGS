for year in 2003 2012 2013
do
for chr in Ipurp_chr10 Ipurp_chr11 Ipurp_chr12 Ipurp_chr13 Ipurp_chr14 Ipurp_chr15 Ipurp_chr1 Ipurp_chr2 Ipurp_chr3 Ipurp_chr4 Ipurp_chr5 Ipurp_chr6 Ipurp_chr7 Ipurp_chr8 Ipurp_chr9 Ipurp_scaffold16 
do

vcftools --gzvcf /nfs/turbo/rsbaucom/lab/IP_WGS_Sasha/vcf/phased/Sasha_Ipurp_all_filtered_phased_${year}.vcf.gz  --ldhat --chr ${chr} --out ${chr}_${year} --remove-indels 

done
done



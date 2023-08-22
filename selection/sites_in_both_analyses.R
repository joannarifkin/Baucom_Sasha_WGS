##### Identify regions under selection in both analyses ##### 

library(dplyr)

setwd("E:/Users/Joanna/Dropbox/Professional/University_of_Michigan/WGS_pipeline/Baucom_Sasha_WGS/selection")


bayescan_hits<-read.csv("BayeScan2.1/bayescan_outliers_with_positions_header_fixed.csv", header = T, row.names = NULL)
View(bayescan_hits)
bayescan_hits$chromosome<-as.numeric(bayescan_hits$chromosome)
bayescan_hits$POS<-as.numeric(bayescan_hits$POS)

bayenv_hits<-read.csv("bayenv/bayenv_genome_wide_hits.csv", row.names = NULL)
bayenv_hits$chr<-as.numeric(bayenv_hits$chr)
View(bayenv_hits)
colnames(bayenv_hits)
intersect(bayescan_hits[,c(2,4)], bayenv_hits[,c(1,14)])
intersect(bayescan_hits[,c(4)], bayenv_hits[,c(14)])

library(tidyverse)
library(readxl)
library(dplyr)
library(tidyr)
library(stringr)
setwd("E:/Users/Joanna/Dropbox/Professional/University_of_Michigan/WGS_pipeline/Baucom_Sasha_WGS")
#update.packages("cli")
#install.packages("cli")



pop_locs<-read_excel("MGwgs_LatLon.xlsx") #Import
#pop_locs<-pop_locs%>%distinct(PopName, .keep_all = TRUE) #Keep only one copy of duplicate records
##View(pop_locs)
colnames(pop_locs)
# "PopNumber" "PopName"   "Year"      "Latitude"  "Longitude"
pop_locs$PopName

germination<-read.csv("WGS_GerminationGrowthFirstFlower.csv") #Import
colnames(germination)
#[1] "PopNumber"                      "PopName"                       
#[3] "Year"                           "ML"                            
#[5] "Rep"                            "Plant_ID"                      
#[7] "ShelfNumber"                    "ShelfPlacement"                
#[9] "SEEWRITTENDATA.GerminationDate" "LC1"                           
#[11] "H1"                             "LCH1_Date"                     
#[13] "LC2"                            "H2"                            
#[15] "LCH2_Date"                      "GrowthRate_LC..LC2.LC1..days"  
#[17] "GrowthRate_H..H2.H1..days"      "FirstFlower_DayInDec"   
germination$Rep<-as.numeric(germination$Rep) #Convert Rep to numeric
unique(germination$PopName)
germination <- germination %>% 
  mutate(PopName = str_replace(PopName, 'Mckinnon', 'McKinnon')) %>% 
  mutate(PopName = str_replace(PopName,  'HareRd', 'HareRoad')) #Fix alternate versions of names


floralmorph<-read.csv("floralmorph.csv") #Import
colnames(floralmorph)
#[1] "X"               "PopNumber"       "PopName"         "Year"            "ML"             
#[6] "ShelfNumber"     "ShelfPlacement"  "CorollaWidth"    "CorollaLength"   "Stress"         
#[11] "measurementWave" "Nectar"          "ID"              "ASD"             "cw_adj"         
#[16] "cl_adj"          "asd_adj"         "brix_adj"        "normCW"          "normCL"         
#[21] "normASD"         "normBrix"        "facYear"         "PopulationName"  "State"          
#[26] "FieldType"       "Lat"             "Long"            "NumberIndsED50" 
colnames(floralmorph)[13]<-"Plant_ID" #Rename column for merging
floralmorph<-floralmorph[,2:29] #drop index column
floralmorph$ML<-as.numeric(floralmorph$ML)
#Get individual means for each plant
unique(floralmorph$PopName)
floralmorph <- floralmorph %>% 
  mutate(PopName = str_replace(PopName, 'Mckinnon', 'McKinnon')) %>% 
  mutate(PopName = str_replace(PopName,  'HareRd', 'HareRoad')) #Fix alternate versions of names

floralmorph_means <- floralmorph %>% select_if(., is.numeric) %>% group_by(Plant_ID, PopNumber, Year) %>%summarise_all(., mean,na.rm = TRUE) #Summarize numeric data for each plant
floralmorph_means$ML<-as.numeric(floralmorph_means$ML)
#View(floralmorph_means)

seqids<-read_excel("WGS_GrowthRoomSequencing.xlsx")
unique(seqids$PopName)
seqids <- seqids %>% 
  mutate(PopName = str_replace(PopName, 'Mckinnon', 'McKinnon')) %>% 
  mutate(PopName = str_replace(PopName,  'HareRd', 'HareRoad')) #Fix alternate versions of names

bamfiles<-read.delim("bam_names.txt", header = F)
colnames(bamfiles)<-"file_name"
bamfiles<-bamfiles %>% separate(., file_name, into=c(NA,NA, NA, "Seq_ID"), sep = "S",  remove = F) %>% separate(., Seq_ID, into=c("Seq_ID", NA), sep="\\.") %>% select(., c(file_name, Seq_ID))
#View(test)
bamfiles$Seq_ID<-as.numeric(bamfiles$Seq_ID)


colnames(seqids)
#[1] "PopNumber" "PopName"   "Year"      "ML"        "Rep"       "Plant_ID"  "Shelf"     "Position" 
#[9] "Seq_ID"    "...10"    

seq_all<-seqids%>%select(c(Seq_ID,PopNumber, PopName, Year, ML, Rep, Plant_ID, Shelf, Position))

intersect(colnames(seq_all), colnames(pop_locs))
#"PopName"   "PopNumber" "Year"

seq_all<-left_join(seq_all, pop_locs, by=c("PopName","PopNumber","Year"))

intersect(colnames(seq_all), colnames(germination))
# "PopNumber" "PopName"   "Year"      "ML"        "Rep"       "Plant_ID" 

seq_all<-left_join(seq_all, germination, by=c("Plant_ID", "PopNumber", "PopName", "Year", "ML", "Rep" ))

intersect(colnames(seq_all), colnames(floralmorph_means))
#[1] "PopNumber"      "Year"           "ML"             "Plant_ID"       "ShelfNumber"   
#[6] "ShelfPlacement"


seq_all$ML<-as.numeric(seq_all$ML)
seq_all<-left_join(seq_all, floralmorph_means, by=c("Plant_ID", "PopNumber", "Year", "ShelfNumber", "ShelfPlacement")) #Omit ML because 11.24 doesn't have an ML and joining on NAs breaks it

intersect(colnames(seq_all), colnames(bamfiles))

seq_all<-left_join(seq_all, bamfiles, by="Seq_ID")
#View(seq_all)

write.csv(seq_all, quote=F, row.names = F, "all_phenotypes_seq_INDs.csv")

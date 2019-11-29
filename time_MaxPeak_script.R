library(tidyr)
library(dplyr)


#Set working directory to the folder containing the files


#example: setwd("C:/LOCATION/OF/CALSCREENER/FILES/")

#just type in the name of the file and then press Source

filename="testdata.csv"  

#Will export a csv file with the suffix "_out" containing the time for the max heat value

########Well Names##############

B1<-"AB0.01"
B2<-"AB0.1"
B3<-"AB0.5"
B4<-"AB1"
B5<-"AB10"
B6<-"SB0.01"
B7<-"SB0.1"
B8<-"SB0.5"
C1<-"PC0.01"
C2<-"PC0.1"
C3<-"PC0.5"
C4<-"PC1"
C5<-"PC10"
C6<-"SB1"
C7<-"SB10"
C8<-"SB50"
D1<-"AB0.01"
D2<-"AB0.1"
D3<-"AB0.5"
D4<-"AB1"
D5<-"AB10"
D6<-"SB0.01"
D7<-"SB0.1"
D8<-"SB0.5"
E1<-"PC0.01"
E2<-"PC0.1"
E3<-"PC0.5"
E4<-"PC1"
E5<-"PC10"
E6<-"SB1"
E7<-"SB10"
E8<-"AB50"


sample_names<-c(B1,
                B2,
                B3,
                B4,
                B5,
                B6,
                B7,
                B8,
                C1,
                C2,
                C3,
                C4,
                C5,
                C6,
                C7,
                C8,
                D1,
                D2,
                D3,
                D4,
                D5,
                D6,
                D7,
                D8,
                E1,
                E2,
                E3,
                E4,
                E5,
                E6,
                E7,
                E8)



##############################################################################
###############Dont need to do anything with the stuff below #################
##############################################################################

#Read in the File

data<-read.table(paste("./",filename,sep=""), sep=";",header=T,dec=",") 


#Reformat column headers

colnames(data)<-gsub("\\..*$","",colnames(data)) 

#Reshape the data

data_max<-data %>%
  gather(key="key",value="value",2:ncol(data)) %>% #converts the data into long format 
  group_by(key)  %>%
  filter(value %in% max(value))%>%  #find the max heat transfer value for each well  
  filter(Time %in% min(Time))       #finds the first occurance of the max value, i.e. first max peak

#reorder columns 
data_max<-data_max[,c(2,3,1)]
colnames(data_max)<-c("Well", "Heat Flow","Time_sec")

#Order the well names and sample_names

data_max<-data_max[order(data_max$Well),]

#Add time as hours
data_max$Time_hours<-data_max$Time_sec/3600

#Add Sample Names

data_max$Well<-sample_names

write.csv(data_max,paste("./",gsub("\\.csv$","",filename),"_out.csv",sep=""),row.names = F)

################################################################################





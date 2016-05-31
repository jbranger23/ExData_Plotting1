## This R scripts download the data, creates a subset of the data required
## and write it in the working directory to create the required plots afterward
##------------------------------------------------------------------------------
## Loading  used libraries if necesary
if(!("dplyr" %in% rownames(installed.packages()))){install.packages("dplyr");library(dplyr)}else{library(dplyr)}
if(!("lubridate" %in% rownames(installed.packages()))){ install.packages("lubridate"); library(lubridate)}else{library(lubridate)}
##------------------------------------------------------------------------------

if (!file.exists("data")) {dir.create("data")}

## File download and uncompress
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","data/data.zip","curl")
unzip("data/data.zip",exdir = "data/")
unlink("data/data.zip")

## Create the varible classes vector
cClasses<-c(rep("character",2),rep("numeric",7))

## reading the data
data<-read.table("data/household_power_consumption.txt",sep=";",header = TRUE,colClasses = cClasses,na.strings = "?");rm(cClasses)

#### re-adjusting date and time for convinience 
## new temporal vector with concatenation of date and time
fullDate<-as.POSIXct(strptime(paste(data[,1],data[,2],sep = " "),format = "%d/%m/%Y %H:%M:%S"))
## adding the variable fulDate, selecting valid variables and re-ordering 
data<-select(mutate(data,timeStamp=fullDate),c(timeStamp,Global_active_power:Sub_metering_3));rm(fullDate)
## Filtering for the data required for the assignment
twoDaySubset<-filter(data,
        year(data$timeStamp) == 2007 & 
        month(data$timeStamp) == 02 & 
        (day(data$timeStamp) == 01 | day(data$timeStamp) == 02))
rm(data)
## write to working directory
write.table(twoDaySubset,"data/twoDaySubset.csv",sep=";",col.names = TRUE,row.names = FALSE)

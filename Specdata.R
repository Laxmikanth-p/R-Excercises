# Function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) 
# across a specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory', 
# 'pollutant', and 'id'. 
# Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data
# from the directory specified 
# in the 'directory' argument and returns the mean of the pollutant across all of the monitors, 
# ignoring any missing values coded as NA.

Polutantmean <- function(directory, pollutant, id = 1:332){
  setwd("/Users/lpendyala/Documents/R-Scripts/")
  for(i in id)
  {
    i
    if(id[i] <10){
      str = paste(directory,"/00",id[i],".csv", sep="")
    } else if(id[i] < 100){
      str = paste(directory,"/0",id[i],".csv",sep="")
    } else {
      str = paste(directory,"/"+id[i],".csv",sep="")
    }
    rows <- read.csv(str,TRUE)
  }
  
}
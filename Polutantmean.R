# Function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate)
# across a specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory',
# 'pollutant', and 'id'.
# Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data
# from the directory specified
# in the 'directory' argument and returns the mean of the pollutant across all of the monitors,
# ignoring any missing values coded as NA.

Pollutantmean <- function(directory, pollutant, id = 1:332) {
      #Set the working directory
      setwd("/Users/lpendyala/Documents/R-Scripts/")
      #Variable declarations
      meanval <- 0
      counter <- 1
      files <- list.files(directory)
      subsetFiles <- files[id]
      subsetFiles1 <- subsetFiles[!is.na(subsetFiles)]
      for (i in subsetFiles1) {
            filepaths <- paste(directory, "/", i, sep = '')
            data1 <- read.csv(filepaths)
            meanval <- meanval + GetMean(data1[pollutant])
            counter <- counter + 1
      }
      meanval / counter
}

GetMean <- function(data) {
      bad <- is.na(data)
      mean(data[!bad])
}


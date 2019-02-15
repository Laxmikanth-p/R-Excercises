#Function that reads a directory full of files and reports the number of completely observed
#cases in each data file. The function should return a data frame where the first column is
#the name of the file and the second column is the number of complete cases. A prototype of
#this function follows

complete <- function(directory, ids = 1:332) {
      #Set the working directory
      setwd("/Users/lpendyala/Documents/R-Scripts/")
      filenames <- list.files(directory)
      filenames <- filenames[ids]
      filenames <- paste(directory, "//", filenames, sep = "")
      id <- numeric(length(ids))
      nobs <- numeric(length(ids))
      for (i in 1:length(ids)) {
            id[i] <- ids[i]
            nobs[i] <- sum(complete.cases(read.csv(filenames[i])))
      }
      data.frame(id, nobs, stringsAsFactors = F)
}

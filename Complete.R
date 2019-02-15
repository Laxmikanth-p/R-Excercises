#Function that reads a directory full of files and reports the number of completely observed 
#cases in each data file. The function should return a data frame where the first column is 
#the name of the file and the second column is the number of complete cases. A prototype of 
#this function follows

Complete <- function(directory, id = 1:332){
      #Set the working directory
      setwd("/Users/lpendyala/Documents/R-Scripts/")
      result <- data.frame()
      files <- list.files(directory)
      subsetFiles <- files[id]
      subsetFiles1 <- subsetFiles[!is.na(subsetFiles)]
      for (i in subsetFiles1) {
            filepaths <- paste(directory, "/", i, sep = '')
            data1 <- read.csv(filepaths)
            data <- cbind(data1,complete.cases(data1))
            data2 <- subset(data[5],data[5]==TRUE)
            #print(nrow(data2))
            #print(c(id,nrow(data2)))
            result <- rbind(result, c(head(data1,1)$ID,nrow(data2)))
      }
      names(result) <- c("ID","nobs")
      result
}

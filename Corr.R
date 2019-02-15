#Function that takes a directory of data files and a threshold for complete cases and calculates 
#the correlation between sulfate and nitrate for monitor locations where the number of completely 
#observed cases (on all variables) is greater than the threshold. The function should return a vector 
#of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold 
#requirement, then the function should return a numeric vector of length 0. A prototype of this function 
#follows

corr <- function(directory, thresold = 0) {
      #Set the working directory
      setwd("/Users/lpendyala/Documents/R-Scripts/")
      files <- list.files(directory)
      cor_vector <- vector()
      for (i in files) {
            filepaths <- paste(directory, "//", i, sep = '')
            data <- read.csv(filepaths)
            monitor <- sum(complete.cases(data))
            if (monitor > thresold) {
                  cor_vector <- c(cor_vector, cor(data[2], data[3],use = "pairwise.complete.obs"))
            }
      }
      cor_vector
}
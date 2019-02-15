# Function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate)
# across a specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory',
# 'pollutant', and 'id'.
# Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data
# from the directory specified
# in the 'directory' argument and returns the mean of the pollutant across all of the monitors,
# ignoring any missing values coded as NA.

pollutantmean <- function(directory, pollutant, id = 1:332) {
      filenames <- list.files(directory)
      filenames <- filenames[id]
      filenames <- paste(directory, "//", filenames, sep = "")
      all_data <- data.frame(Date = numeric(), sulphate = numeric(), nitrate = numeric(), ID = numeric())
      for (i in 1:length(id)) {
            all_data <- rbind(all_data, read.csv(filenames[i]))
      }
      mean(all_data[, pollutant], na.rm = T)   
}



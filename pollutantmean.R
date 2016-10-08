pollutantmean <- function(directory, pollutant, id=1:332) {
  ## 'directory' is a character vectory of length 1 indicating
  ## the location of the csv files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the 
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors listed
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  substrRight <- function(x, n){
    substr(x, nchar(x)-n+1, nchar(x))
  }
  
  totalVector <- c()
  
  # First loop through the id's in the vector list:
  for (fileNumber in id) {
    theFileName <- paste(directory,substrRight(paste('00',fileNumber,sep=''),3),'.csv',sep='')
    
    csvData <- read.csv(file=theFileName, header=TRUE, sep=",")
    
    for (rowOfData in csvData[[pollutant]][!is.na(csvData[[pollutant]])]) {
      totalVector <- c(totalVector,rowOfData)
    }
  }
  
  # Create a single vector with all the values we need so that we can get 
  # the mean
  mean(totalVector)
}
corr <- function(directory, threshold = 0) {
  ## directory is where the data files are
  
  ## threhsold is a numeric vector of length 1 indicating the number of 
  ## completely observed observations (on all variables) required to compute
  ## the correlation between nitrate and sulfate; the default is 0
  
  ## return a numeric vector of correlations NOT ROUNDED
  
  substrRight <- function(x, n){
    substr(x, nchar(x)-n+1, nchar(x))
  }
  
  id <- 1:332
  
  allCompleteArray <- c()
  
  # First loop through the id's in the vector list:
  for (fileNumber in id) {
    theFileName <- paste(directory,substrRight(paste('00',fileNumber,sep=''),3),'.csv',sep='')
    
    csvData <- read.csv(file=theFileName, header=TRUE, sep=",")
    csvData <- csvData[complete.cases(csvData),]
    
    if (nrow(csvData) > threshold) {
      allCompleteArray = c(allCompleteArray, cor(csvData$sulfate,csvData$nitrate))
    }
  }
  
  allCompleteArray
}
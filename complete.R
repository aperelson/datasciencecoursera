complete <- function(directory, id = 1:332) {
  
  ## 'directory' is the location of the files
  
  ## id is the monitor numbers to ne used
  
  ## return a dataframe of the form:
  ## id nobs
  ## 1  117
  ## 2 1041
  ## ...
  
  substrRight <- function(x, n){
    substr(x, nchar(x)-n+1, nchar(x))
  }
  
  totalArray <- data.frame("id"=integer(),"nobs"=integer())
  
  # First loop through the id's in the vector list:
  for (fileNumber in id) {
    theFileName <- paste(directory,substrRight(paste('00',fileNumber,sep=''),3),'.csv',sep='')
    
    csvData <- read.csv(file=theFileName, header=TRUE, sep=",")
    csvData <- csvData[complete.cases(csvData),]
    
    totalArray = rbind(totalArray, data.frame("id"=fileNumber,"nobs"=nrow(csvData)))
  }
  
  totalArray
}


corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        filenames <- list.files(directory, full.name=TRUE)
        completev<-complete(directory)
        results<-numeric()
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        overthreshold<-completev$nobs>threshold
        datafiles<-filenames[overthreshold]
        if(length(datafiles)==0){
                return(results)
        }
        else{ 
                for (i in 1:length(datafiles)){
                        data1 <- read.csv(datafiles[i])
                        data2 <- na.omit(data1)
                        x <- data2[2]
                        y <- data2[3] 
                        results[i]<-cor(x,y)
                }
                return(results)
        }
        ## Return a numeric vector of correlations      
}
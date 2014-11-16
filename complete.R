complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        filenames <- list.files(directory, full.name=TRUE)
        selectedfiles<-filenames[id]
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        data<-lapply(selectedfiles, read.csv)
        output<-lapply(data, complete.cases)
        nobs<-lapply(output, sum)
        ## Return a data frame 
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        dataframe<-cbind(id, nobs)
        as.data.frame(dataframe, row.names=NULL)       
}
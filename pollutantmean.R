pollutantmean<-function(directory,pollutant,id=1:332){
                
        filenames <- list.files(directory, full.name=TRUE)
        selectedfiles<-filenames[id]
        data<-lapply(selectedfiles, read.csv)
        output <- do.call(rbind, data)
        mean(output[,pollutant], na.rm=TRUE)
}

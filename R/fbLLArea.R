#req libs: library(plyr)
#calculates area for fieldBook using fieldBookLL as input. 

fbLLArea <- function(fieldBookLL){
fbll <- fieldBookLL
pLength <- unique(fbll$plotLength)
rSpacing <- unique(fbll$rowSpacing)
fbDf <- ddply(fbll, .(plotRows), nrow)
names(fbDf) <- c("plotRows","Freq")
fbDf$Area <- fbDf$plotRows*fbDf$Freq*pLength*rSpacing
Acres <- sum(fbDf$Area)/4047
Hectares <- sum(fbDf$Area)/10000
areas <- as.data.frame(rbind(Acres,Hectares))
names(areas) <- "Field Area"
areas
}
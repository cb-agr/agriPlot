#agriPlotDim.R calculates all four corners of plot dimensions

agriPlotDim <- function(fieldBookLL,dims){
  fieldBookLL <- fieldBookLL
  pi <- 3.141592654
  r_earth  <- 6378137
  rowColDirection <- unique(fieldBookLL$rowColDir)  
  pAngle <- unique(fieldBookLL$plantingAngle) 
  ########begin dims calc##############
  if(rowColDirection == "SN-WE"){
    message("Analyzing rowColDir as SN-WE")
    bufferLat1_2 <- fieldBookLL$Latitude + ((fieldBookLL$plotLength*dims)/r_earth) * (180/pi)
    bufferLong2_1 <- fieldBookLL$Longitude + ((fieldBookLL$rowSpacing*dims*fieldBookLL$plotRows)/r_earth) * (180/pi)/cos(fieldBookLL$Latitude*pi/180) 
    newLLxtwo <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,bufferLong2_1,fieldBookLL$Latitude)
    newLLytwo <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,fieldBookLL$Longitude,bufferLat1_2)
    newLLxytwo <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,bufferLong2_1,bufferLat1_2)
    newLLorig <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,fieldBookLL$Longitude,fieldBookLL$Latitude)
    fbLLDim <- as.data.frame(rbind(newLLorig,newLLxytwo,newLLytwo,newLLxtwo))
    names(fbLLDim) <- c("id","block","plotRowNum","plotColumnNum","plotRows","testNameRep","Longitude","Latitude")
    fbLLDim$Longitude <- as.numeric(as.character(fbLLDim$Longitude))
    fbLLDim$Latitude <- as.numeric(as.character(fbLLDim$Latitude))
    }
  if(rowColDirection == "SN-EW"){
    message("Analyzing rowColDir as SN-WE")
    bufferLat1_2 <- fieldBookLL$Latitude + ((fieldBookLL$plotLength*dims)/r_earth) * (180/pi)
    bufferLong2_1 <- fieldBookLL$Longitude + ((-fieldBookLL$rowSpacing*dims*fieldBookLL$plotRows)/r_earth) * (180/pi)/cos(fieldBookLL$Latitude*pi/180) 
    newLLxtwo <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,bufferLong2_1,fieldBookLL$Latitude)
    newLLytwo <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,fieldBookLL$Longitude,bufferLat1_2)
    newLLxytwo <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,bufferLong2_1,bufferLat1_2)
    newLLorig <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,fieldBookLL$Longitude,fieldBookLL$Latitude)
    fbLLDim <- as.data.frame(rbind(newLLorig,newLLxytwo,newLLytwo,newLLxtwo))
    names(fbLLDim) <- c("id","block","plotRowNum","plotColumnNum","plotRows","testNameRep","Longitude","Latitude")
    fbLLDim$Longitude <- as.numeric(as.character(fbLLDim$Longitude))
    fbLLDim$Latitude <- as.numeric(as.character(fbLLDim$Latitude))
    }
  if(rowColDirection == "NS-WE"){
    message("Analyzing rowColDir as SN-WE")
    bufferLat1_2 <- fieldBookLL$Latitude + ((-fieldBookLL$plotLength*dims)/r_earth) * (180/pi)
    bufferLong2_1 <- fieldBookLL$Longitude + ((fieldBookLL$rowSpacing*dims*fieldBookLL$plotRows)/r_earth) * (180/pi)/cos(fieldBookLL$Latitude*pi/180) 
    newLLxtwo <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,bufferLong2_1,fieldBookLL$Latitude)
    newLLytwo <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,fieldBookLL$Longitude,bufferLat1_2)
    newLLxytwo <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,bufferLong2_1,bufferLat1_2)
    newLLorig <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,fieldBookLL$Longitude,fieldBookLL$Latitude)
    fbLLDim <- as.data.frame(rbind(newLLorig,newLLxytwo,newLLytwo,newLLxtwo))
    names(fbLLDim) <- c("id","block","plotRowNum","plotColumnNum","plotRows","testNameRep","Longitude","Latitude")
    fbLLDim$Longitude <- as.numeric(as.character(fbLLDim$Longitude))
    fbLLDim$Latitude <- as.numeric(as.character(fbLLDim$Latitude))
    }
  if(rowColDirection == "NS-EW"){
    message("Analyzing rowColDir as SN-WE")
    bufferLat1_2 <- fieldBookLL$Latitude + ((-fieldBookLL$plotLength*dims)/r_earth) * (180/pi)
    bufferLong2_1 <- fieldBookLL$Longitude + ((-fieldBookLL$rowSpacing*dims*fieldBookLL$plotRows)/r_earth) * (180/pi)/cos(fieldBookLL$Latitude*pi/180) 
    newLLxtwo <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,bufferLong2_1,fieldBookLL$Latitude)
    newLLytwo <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,fieldBookLL$Longitude,bufferLat1_2)
    newLLxytwo <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,bufferLong2_1,bufferLat1_2)
    newLLorig <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,fieldBookLL$Longitude,fieldBookLL$Latitude)
    fbLLDim <- as.data.frame(rbind(newLLorig,newLLxytwo,newLLytwo,newLLxtwo))
    names(fbLLDim) <- c("id","block","plotRowNum","plotColumnNum","plotRows","testNameRep","Longitude","Latitude")
    fbLLDim$Longitude <- as.numeric(as.character(fbLLDim$Longitude))
    fbLLDim$Latitude <- as.numeric(as.character(fbLLDim$Latitude))
    }
  if(rowColDirection == "WE-SN"){
    message("Analyzing rowColDir as WE-SN")
    bufferLat1_2 <- fieldBookLL$Latitude + ((fieldBookLL$rowSpacing*dims*fieldBookLL$plotRows)/r_earth) * (180/pi)
    bufferLong2_1 <- fieldBookLL$Longitude + ((fieldBookLL$plotLength*dims)/r_earth) * (180/pi)/cos(fieldBookLL$Latitude*pi/180) 
    newLLxtwo <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,bufferLong2_1,fieldBookLL$Latitude)
    newLLytwo <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,fieldBookLL$Longitude,bufferLat1_2)
    newLLxytwo <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,bufferLong2_1,bufferLat1_2)
    newLLorig <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,fieldBookLL$Longitude,fieldBookLL$Latitude)
    fbLLDim <- as.data.frame(rbind(newLLorig,newLLxytwo,newLLytwo,newLLxtwo))
    names(fbLLDim) <- c("id","block","plotRowNum","plotColumnNum","plotRows","testNameRep","Longitude","Latitude")
    fbLLDim$Longitude <- as.numeric(as.character(fbLLDim$Longitude))
    fbLLDim$Latitude <- as.numeric(as.character(fbLLDim$Latitude))
    }
  if(rowColDirection == "WE-NS"){
    message("Analyzing rowColDir as WE-SN")
    bufferLat1_2 <- fieldBookLL$Latitude + ((-fieldBookLL$rowSpacing*dims*fieldBookLL$plotRows)/r_earth) * (180/pi)
    bufferLong2_1 <- fieldBookLL$Longitude + ((fieldBookLL$plotLength*dims)/r_earth) * (180/pi)/cos(fieldBookLL$Latitude*pi/180) 
    newLLxtwo <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,bufferLong2_1,fieldBookLL$Latitude)
    newLLytwo <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,fieldBookLL$Longitude,bufferLat1_2)
    newLLxytwo <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,bufferLong2_1,bufferLat1_2)
    newLLorig <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,fieldBookLL$Longitude,fieldBookLL$Latitude)
    fbLLDim <- as.data.frame(rbind(newLLorig,newLLxytwo,newLLytwo,newLLxtwo))
    names(fbLLDim) <- c("id","block","plotRowNum","plotColumnNum","plotRows","testNameRep","Longitude","Latitude")
    fbLLDim$Longitude <- as.numeric(as.character(fbLLDim$Longitude))
    fbLLDim$Latitude <- as.numeric(as.character(fbLLDim$Latitude))
    }
  if(rowColDirection == "EW-SN"){
    message("Analyzing rowColDir as WE-SN")
    bufferLat1_2 <- fieldBookLL$Latitude + ((fieldBookLL$rowSpacing*dims*fieldBookLL$plotRows)/r_earth) * (180/pi)
    bufferLong2_1 <- fieldBookLL$Longitude + ((-fieldBookLL$plotLength*dims)/r_earth) * (180/pi)/cos(fieldBookLL$Latitude*pi/180) 
    newLLxtwo <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,bufferLong2_1,fieldBookLL$Latitude)
    newLLytwo <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,fieldBookLL$Longitude,bufferLat1_2)
    newLLxytwo <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,bufferLong2_1,bufferLat1_2)
    newLLorig <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,fieldBookLL$Longitude,fieldBookLL$Latitude)
    fbLLDim <- as.data.frame(rbind(newLLorig,newLLxytwo,newLLytwo,newLLxtwo))
    names(fbLLDim) <- c("id","block","plotRowNum","plotColumnNum","plotRows","testNameRep","Longitude","Latitude")
    fbLLDim$Longitude <- as.numeric(as.character(fbLLDim$Longitude))
    fbLLDim$Latitude <- as.numeric(as.character(fbLLDim$Latitude))
    }
  if(rowColDirection == "EW-NS"){
    message("Analyzing rowColDir as WE-SN")
    bufferLat1_2 <- fieldBookLL$Latitude + ((-fieldBookLL$rowSpacing*dims*fieldBookLL$plotRows)/r_earth) * (180/pi)
    bufferLong2_1 <- fieldBookLL$Longitude + ((-fieldBookLL$plotLength*dims)/r_earth) * (180/pi)/cos(fieldBookLL$Latitude*pi/180) 
    newLLxtwo <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,bufferLong2_1,fieldBookLL$Latitude)
    newLLytwo <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,fieldBookLL$Longitude,bufferLat1_2)
    newLLxytwo <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,bufferLong2_1,bufferLat1_2)
    newLLorig <- cbind(fieldBookLL$id,fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNameRep,fieldBookLL$Longitude,fieldBookLL$Latitude)
    fbLLDim <- as.data.frame(rbind(newLLorig,newLLxytwo,newLLytwo,newLLxtwo))
    names(fbLLDim) <- c("id","block","plotRowNum","plotColumnNum","plotRows","testNameRep","Longitude","Latitude")
    fbLLDim$Longitude <- as.numeric(as.character(fbLLDim$Longitude))
    fbLLDim$Latitude <- as.numeric(as.character(fbLLDim$Latitude))
    }
  ########end buffer calc##############
  
  return(fbLLDim)
  
}







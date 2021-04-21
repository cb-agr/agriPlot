agriPlotBuffer <- function(fieldBookLL,buffer){
  fieldBookLL <- fieldBookLL
  pi <- 3.141592654
  r_earth  <- 6378137
  rowColDirection <- unique(fieldBookLL$rowColDir)  
  pAngle <- unique(fieldBookLL$plantingAngle) 
  ########beginMulti##############
  if(rowColDirection == "SN-WE"){
    message("Analyzing rowColDir as SN-WE")
    bufferLat1_2 <- fieldBookLL$Latitude + ((fieldBookLL$plotLength*buffer)/r_earth) * (180/pi)
    bufferLong2_1 <- fieldBookLL$Longitude + ((fieldBookLL$rowSpacing*buffer*fieldBookLL$plotRows)/r_earth) * (180/pi)/cos(fieldBookLL$Latitude*pi/180) 
    newLLxtwo <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,bufferLong2_1,fieldBookLL$Latitude)
    newLLytwo <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,fieldBookLL$Longitude,bufferLat1_2)
    newLLxytwo <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,bufferLong2_1,bufferLat1_2)
    newLLorig <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,fieldBookLL$Longitude,fieldBookLL$Latitude)
    fbLLBuff <- as.data.frame(rbind(newLLorig,newLLxytwo,newLLytwo,newLLxtwo))
    names(fbLLBuff) <- c("block","plotRowNum","plotColumnNum","plotRows","testNoRep","Longitude","Latitude")
  }
  if(rowColDirection == "SN-EW"){
    message("Analyzing rowColDir as SN-WE")
    bufferLat1_2 <- fieldBookLL$Latitude + ((fieldBookLL$plotLength*buffer)/r_earth) * (180/pi)
    bufferLong2_1 <- fieldBookLL$Longitude + ((-fieldBookLL$rowSpacing*buffer*fieldBookLL$plotRows)/r_earth) * (180/pi)/cos(fieldBookLL$Latitude*pi/180) 
    newLLxtwo <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,bufferLong2_1,fieldBookLL$Latitude)
    newLLytwo <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,fieldBookLL$Longitude,bufferLat1_2)
    newLLxytwo <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,bufferLong2_1,bufferLat1_2)
    newLLorig <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,fieldBookLL$Longitude,fieldBookLL$Latitude)
    fbLLBuff <- as.data.frame(rbind(newLLorig,newLLxytwo,newLLytwo,newLLxtwo))
    names(fbLLBuff) <- c("block","plotRowNum","plotColumnNum","plotRows","testNoRep","Longitude","Latitude")
  }
  if(rowColDirection == "NS-WE"){
    message("Analyzing rowColDir as SN-WE")
    bufferLat1_2 <- fieldBookLL$Latitude + ((-fieldBookLL$plotLength*buffer)/r_earth) * (180/pi)
    bufferLong2_1 <- fieldBookLL$Longitude + ((fieldBookLL$rowSpacing*buffer*fieldBookLL$plotRows)/r_earth) * (180/pi)/cos(fieldBookLL$Latitude*pi/180) 
    newLLxtwo <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,bufferLong2_1,fieldBookLL$Latitude)
    newLLytwo <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,fieldBookLL$Longitude,bufferLat1_2)
    newLLxytwo <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,bufferLong2_1,bufferLat1_2)
    newLLorig <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,fieldBookLL$Longitude,fieldBookLL$Latitude)
    fbLLBuff <- as.data.frame(rbind(newLLorig,newLLxytwo,newLLytwo,newLLxtwo))
    names(fbLLBuff) <- c("block","plotRowNum","plotColumnNum","plotRows","testNoRep","Longitude","Latitude")
  }
  if(rowColDirection == "NS-EW"){
    message("Analyzing rowColDir as SN-WE")
    bufferLat1_2 <- fieldBookLL$Latitude + ((-fieldBookLL$plotLength*buffer)/r_earth) * (180/pi)
    bufferLong2_1 <- fieldBookLL$Longitude + ((-fieldBookLL$rowSpacing*buffer*fieldBookLL$plotRows)/r_earth) * (180/pi)/cos(fieldBookLL$Latitude*pi/180) 
    newLLxtwo <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,bufferLong2_1,fieldBookLL$Latitude)
    newLLytwo <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,fieldBookLL$Longitude,bufferLat1_2)
    newLLxytwo <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,bufferLong2_1,bufferLat1_2)
    newLLorig <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,fieldBookLL$Longitude,fieldBookLL$Latitude)
    fbLLBuff <- as.data.frame(rbind(newLLorig,newLLxytwo,newLLytwo,newLLxtwo))
    names(fbLLBuff) <- c("block","plotRowNum","plotColumnNum","plotRows","testNoRep","Longitude","Latitude")
  }
  if(rowColDirection == "WE-SN"){
    message("Analyzing rowColDir as WE-SN")
    bufferLat1_2 <- fieldBookLL$Latitude + ((fieldBookLL$rowSpacing*buffer*fieldBookLL$plotRows)/r_earth) * (180/pi)
    bufferLong2_1 <- fieldBookLL$Longitude + ((fieldBookLL$plotLength*buffer)/r_earth) * (180/pi)/cos(fieldBookLL$Latitude*pi/180) 
    newLLxtwo <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,bufferLong2_1,fieldBookLL$Latitude)
    newLLytwo <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,fieldBookLL$Longitude,bufferLat1_2)
    newLLxytwo <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,bufferLong2_1,bufferLat1_2)
    newLLorig <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,fieldBookLL$Longitude,fieldBookLL$Latitude)
    fbLLBuff <- as.data.frame(rbind(newLLorig,newLLxytwo,newLLytwo,newLLxtwo))
    names(fbLLBuff) <- c("block","plotRowNum","plotColumnNum","plotRows","testNoRep","Longitude","Latitude")
  }
  if(rowColDirection == "WE-NS"){
    message("Analyzing rowColDir as WE-SN")
    bufferLat1_2 <- fieldBookLL$Latitude + ((-fieldBookLL$rowSpacing*buffer*fieldBookLL$plotRows)/r_earth) * (180/pi)
    bufferLong2_1 <- fieldBookLL$Longitude + ((fieldBookLL$plotLength*buffer)/r_earth) * (180/pi)/cos(fieldBookLL$Latitude*pi/180) 
    newLLxtwo <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,bufferLong2_1,fieldBookLL$Latitude)
    newLLytwo <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,fieldBookLL$Longitude,bufferLat1_2)
    newLLxytwo <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,bufferLong2_1,bufferLat1_2)
    newLLorig <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,fieldBookLL$Longitude,fieldBookLL$Latitude)
    fbLLBuff <- as.data.frame(rbind(newLLorig,newLLxytwo,newLLytwo,newLLxtwo))
    names(fbLLBuff) <- c("block","plotRowNum","plotColumnNum","plotRows","testNoRep","Longitude","Latitude")
  }
  if(rowColDirection == "EW-SN"){
    message("Analyzing rowColDir as WE-SN")
    bufferLat1_2 <- fieldBookLL$Latitude + ((fieldBookLL$rowSpacing*buffer*fieldBookLL$plotRows)/r_earth) * (180/pi)
    bufferLong2_1 <- fieldBookLL$Longitude + ((-fieldBookLL$plotLength*buffer)/r_earth) * (180/pi)/cos(fieldBookLL$Latitude*pi/180) 
    newLLxtwo <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,bufferLong2_1,fieldBookLL$Latitude)
    newLLytwo <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,fieldBookLL$Longitude,bufferLat1_2)
    newLLxytwo <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,bufferLong2_1,bufferLat1_2)
    newLLorig <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,fieldBookLL$Longitude,fieldBookLL$Latitude)
    fbLLBuff <- as.data.frame(rbind(newLLorig,newLLxytwo,newLLytwo,newLLxtwo))
    names(fbLLBuff) <- c("block","plotRowNum","plotColumnNum","plotRows","testNoRep","Longitude","Latitude")
  }
  if(rowColDirection == "EW-NS"){
    message("Analyzing rowColDir as WE-SN")
    bufferLat1_2 <- fieldBookLL$Latitude + ((-fieldBookLL$rowSpacing*buffer*fieldBookLL$plotRows)/r_earth) * (180/pi)
    bufferLong2_1 <- fieldBookLL$Longitude + ((-fieldBookLL$plotLength*buffer)/r_earth) * (180/pi)/cos(fieldBookLL$Latitude*pi/180) 
    newLLxtwo <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,bufferLong2_1,fieldBookLL$Latitude)
    newLLytwo <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,fieldBookLL$Longitude,bufferLat1_2)
    newLLxytwo <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,bufferLong2_1,bufferLat1_2)
    newLLorig <- cbind(fieldBookLL$block,fieldBookLL$plotRowNum,fieldBookLL$plotColumnNum,fieldBookLL$plotRows,fieldBookLL$testNoRep,fieldBookLL$Longitude,fieldBookLL$Latitude)
    fbLLBuff <- as.data.frame(rbind(newLLorig,newLLxytwo,newLLytwo,newLLxtwo))
    names(fbLLBuff) <- c("block","plotRowNum","plotColumnNum","plotRows","testNoRep","Longitude","Latitude")
  }
  ########end##############
  
  return(fbLLBuff)
  
}







#req libs: library(plyr), library(data.table)
#agriDemoPlot.R has the exact same functionality as agriPlot. However, agriDemoPlot.R takes a demoFieldBook as input generated from demoFieldBook.R. The main difference is that it does not generate the TestNoRep concatenated column as in agriPlot.R. It's obviously a little redundant on the code from agriPlot.R but the point is to easily/quickly generate a fieldBook with Long/Lat for viewing plots in a particular field using satellite imagery. 

agriDemoPlot <- function(fieldBook,initialLong,initialLat,rowSpacing,plotLength,rowColDir,plantingAngle){
  fb <- fieldBook
  pi <- 3.141592654
  r_earth  <- 6378137
  
  ###plotRow sums for SN/NS plantings - begin###
  #this code is accounting for SN/NS (i.e. vertical orientation) fields with different plotRows to calculate respective row spacing from a cumulative sum of plotRows 
  fbSortSumsS_N <- ddply(fb, .(plotColumNum, plotRows), nrow)
  fbSelectS_N <- fbSortSumsS_N[1:2]
  setDT(fbSelectS_N)[, changeFromPrevious := shift(plotRows, fill = plotRows[1]) - plotRows]
  fbSelectS_N$newPlotRows <- fbSelectS_N$plotRows + fbSelectS_N$changeFromPrevious
  fbSelectS_N[1,4] <- 0
  fbSumPlotRowsS_N <- data.frame(fbSelectS_N, plotRowSums=cumsum(fbSelectS_N$newPlotRows))
  fbSumPLotRowsS_N_comb <- cbind(fbSumPlotRowsS_N[1:1],fbSumPlotRowsS_N[5:5])
  fbS_N <- join(fb,fbSumPLotRowsS_N_comb,by="plotColumNum")
  planterRowSpaceS_N <- rowSpacing*fbS_N$plotRowSums
  ###for SN/NS plantings - end###
  
  ###plotRow sums for EW/WE plantings - begin###
  #this code is accounting for EW/WE (i.e. horizontal orientation) fields with different plotRows to calculate respective row spacing from a cumulative sum of plotRows
  fbSortSumsE_W <- ddply(fb, .(plotRowNum, plotRows), nrow)
  fbSelectE_W <- fbSortSumsE_W[1:2]
  setDT(fbSelectE_W)[, changeFromPrevious := shift(plotRows, fill = plotRows[1]) - plotRows]
  fbSelectE_W$newPlotRows <- fbSelectE_W$plotRows + fbSelectE_W$changeFromPrevious
  fbSelectE_W[1,4] <- 0
  fbSumPlotRowsE_W <- data.frame(fbSelectE_W, plotRowSums=cumsum(fbSelectE_W$newPlotRows))
  fbSumPLotRowsE_W_comb <- cbind(fbSumPlotRowsE_W[1:1],fbSumPlotRowsE_W[5:5])
  fbE_W <- join(fb,fbSumPLotRowsE_W_comb,by="plotRowNum")
  planterRowSpaceE_W <- rowSpacing*fbE_W$plotRowSums
  ###for EW/WE plantings - end###
  
  ######## long/lat calculations begin##############
  if(rowColDir == "SN-WE"){ # core piece of agriPlot to calculate long/lat for each plot, basically the same code throughout but accounts for rowColDir (i.e. planting direction). 
    message("Analyzing rowColDir as SN-WE") # calculations are geographic distance calculations with respect to earth's surface  
    iPlotLat <- initialLat + (plotLength/r_earth) * (180/pi) * (fbS_N$plotRowNum-1)
    iPlotLong <- initialLong + (planterRowSpaceS_N/r_earth) * (180/pi)/cos(initialLat*pi/180) 
    diffLong <- iPlotLong - initialLong
    diffLat <- iPlotLat - initialLat
    fbS_N$initialLong <- initialLong
    fbS_N$initialLat <- initialLat
    fbS_N$rowSpacing <- rowSpacing
    fbS_N$plotLength <- plotLength
    fbS_N$rowColDir <- rowColDir
    fbS_N$plantingAngle <- plantingAngle
    fbS_N$Longitude <- diffLong * cos(plantingAngle*pi/180) - diffLat * sin(plantingAngle*pi/180) + initialLong
    fbS_N$Latitude <- diffLong * sin(plantingAngle*pi/180) + diffLat * cos(plantingAngle*pi/180) + initialLat
    fbOut <- fbS_N
  }
  if(rowColDir == "SN-EW"){
    message("Analyzing rowColDir as SN-EW")
    iPlotLat <- initialLat + (plotLength/r_earth) * (180/pi) * (fbS_N$plotRowNum-1)
    iPlotLong <- initialLong + (-planterRowSpaceS_N/r_earth) * (180/pi)/cos(initialLat*pi/180) 
    diffLong <- iPlotLong - initialLong
    diffLat <- iPlotLat - initialLat
    fbS_N$initialLong <- initialLong
    fbS_N$initialLat <- initialLat
    fbS_N$rowSpacing <- rowSpacing
    fbS_N$plotLength <- plotLength
    fbS_N$rowColDir <- rowColDir
    fbS_N$plantingAngle <- plantingAngle
    fbS_N$Longitude <- diffLong * cos(plantingAngle*pi/180) - diffLat * sin(plantingAngle*pi/180) + initialLong
    fbS_N$Latitude <- diffLong * sin(plantingAngle*pi/180) + diffLat * cos(plantingAngle*pi/180) + initialLat
    fbOut <- fbS_N
  }
  if(rowColDir == "NS-WE"){
    message("Analyzing rowColDir as NS-WE")
    iPlotLat <- initialLat + (-plotLength/r_earth) * (180/pi) * (fbS_N$plotRowNum-1)
    iPlotLong <- initialLong + (planterRowSpaceS_N/r_earth) * (180/pi)/cos(initialLat*pi/180) 
    diffLong <- iPlotLong - initialLong
    diffLat <- iPlotLat - initialLat
    fbS_N$initialLong <- initialLong
    fbS_N$initialLat <- initialLat
    fbS_N$rowSpacing <- rowSpacing
    fbS_N$plotLength <- plotLength
    fbS_N$rowColDir <- rowColDir
    fbS_N$plantingAngle <- plantingAngle
    fbS_N$Longitude <- diffLong * cos(plantingAngle*pi/180) - diffLat * sin(plantingAngle*pi/180) + initialLong
    fbS_N$Latitude <- diffLong * sin(plantingAngle*pi/180) + diffLat * cos(plantingAngle*pi/180) + initialLat
    fbOut <- fbS_N
  }
  if(rowColDir == "NS-EW"){
    message("Analyzing rowColDir as NS-EW")
    iPlotLat <- initialLat + (-plotLength/r_earth) * (180/pi) * (fbS_N$plotRowNum-1)
    iPlotLong <- initialLong + (-planterRowSpaceS_N/r_earth) * (180/pi)/cos(initialLat*pi/180) 
    diffLong <- iPlotLong - initialLong
    diffLat <- iPlotLat - initialLat
    fbS_N$initialLong <- initialLong
    fbS_N$initialLat <- initialLat
    fbS_N$rowSpacing <- rowSpacing
    fbS_N$plotLength <- plotLength
    fbS_N$rowColDir <- rowColDir
    fbS_N$plantingAngle <- plantingAngle
    fbS_N$Longitude <- diffLong * cos(plantingAngle*pi/180) - diffLat * sin(plantingAngle*pi/180) + initialLong
    fbS_N$Latitude <- diffLong * sin(plantingAngle*pi/180) + diffLat * cos(plantingAngle*pi/180) + initialLat
    fbOut <- fbS_N
  }
  if(rowColDir == "WE-SN"){
    message("Analyzing rowColDir as WE-SN")
    iPlotLat <- initialLat + (planterRowSpaceE_W/r_earth) * (180/pi) 
    iPlotLong <- initialLong + (plotLength/r_earth) * (180/pi)/cos(initialLat*pi/180) * (fbE_W$plotColumNum-1)
    diffLong <- iPlotLong - initialLong
    diffLat <- iPlotLat - initialLat
    fbE_W$initialLong <- initialLong
    fbE_W$initialLat <- initialLat
    fbE_W$rowSpacing <- rowSpacing
    fbE_W$plotLength <- plotLength
    fbE_W$rowColDir <- rowColDir
    fbE_W$plantingAngle <- plantingAngle
    fbE_W$Longitude <- diffLong * cos(plantingAngle*pi/180) - diffLat * sin(plantingAngle*pi/180) + initialLong
    fbE_W$Latitude <- diffLong * sin(plantingAngle*pi/180) + diffLat * cos(plantingAngle*pi/180) + initialLat
    fbOut <- fbE_W
  }
  if(rowColDir == "WE-NS"){
    message("Analyzing rowColDir as WE-NS")
    iPlotLat <- initialLat + (-planterRowSpaceE_W/r_earth) * (180/pi) 
    iPlotLong <- initialLong + (plotLength/r_earth) * (180/pi)/cos(initialLat*pi/180) * (fbE_W$plotColumNum-1)
    diffLong <- iPlotLong - initialLong
    diffLat <- iPlotLat - initialLat
    fbE_W$initialLong <- initialLong
    fbE_W$initialLat <- initialLat
    fbE_W$rowSpacing <- rowSpacing
    fbE_W$plotLength <- plotLength
    fbE_W$rowColDir <- rowColDir
    fbE_W$plantingAngle <- plantingAngle
    fbE_W$Longitude <- diffLong * cos(plantingAngle*pi/180) - diffLat * sin(plantingAngle*pi/180) + initialLong
    fbE_W$Latitude <- diffLong * sin(plantingAngle*pi/180) + diffLat * cos(plantingAngle*pi/180) + initialLat
    fbOut <- fbE_W
  }
  if(rowColDir == "EW-SN"){
    message("Analyzing rowColDir as EW-SN")
    iPlotLat <- initialLat + (planterRowSpaceE_W/r_earth) * (180/pi) 
    iPlotLong <- initialLong + (-plotLength/r_earth) * (180/pi)/cos(initialLat*pi/180) * (fbE_W$plotColumNum-1)
    diffLong <- iPlotLong - initialLong
    diffLat <- iPlotLat - initialLat
    fbE_W$initialLong <- initialLong
    fbE_W$initialLat <- initialLat
    fbE_W$rowSpacing <- rowSpacing
    fbE_W$plotLength <- plotLength
    fbE_W$rowColDir <- rowColDir
    fbE_W$plantingAngle <- plantingAngle
    fbE_W$Longitude <- diffLong * cos(plantingAngle*pi/180) - diffLat * sin(plantingAngle*pi/180) + initialLong
    fbE_W$Latitude <- diffLong * sin(plantingAngle*pi/180) + diffLat * cos(plantingAngle*pi/180) + initialLat
    fbOut <- fbE_W
  }
  if(rowColDir == "EW-NS"){
    message("Analyzing rowColDir as EW-NS")
    iPlotLat <- initialLat + (-planterRowSpaceE_W/r_earth) * (180/pi) 
    iPlotLong <- initialLong + (-plotLength/r_earth) * (180/pi)/cos(initialLat*pi/180) * (fbE_W$plotColumNum-1)
    diffLong <- iPlotLong - initialLong
    diffLat <- iPlotLat - initialLat
    fbE_W$initialLong <- initialLong
    fbE_W$initialLat <- initialLat
    fbE_W$rowSpacing <- rowSpacing
    fbE_W$plotLength <- plotLength
    fbE_W$rowColDir <- rowColDir
    fbE_W$plantingAngle <- plantingAngle
    fbE_W$Longitude <- diffLong * cos(plantingAngle*pi/180) - diffLat * sin(plantingAngle*pi/180) + initialLong
    fbE_W$Latitude <- diffLong * sin(plantingAngle*pi/180) + diffLat * cos(plantingAngle*pi/180) + initialLat
    fbOut <- fbE_W
  }
 ######## long/lat calculations end##############
  
  fbOut
  
}







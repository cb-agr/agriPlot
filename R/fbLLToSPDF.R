#req libs: library(sp)
#fbLLToSPDF.R takes a fieldbook with Long/Lat (i.e.output from agriPlot.R or agriDemoPlot.R) and converts it to a SpatialPointsDataFrame using the sp package. Now your fieldBook is spatial object with a CRS that can be used for further geospatial analysis. 

fbLLToSPDF <- function(fieldBookLL,coordRefSys){
fbLL <- fieldBookLL # takes fieldBookLL as input agrument 
if(coordRefSys == "default"){
crdref <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs") # set user defined coordinate reference system. 
fieldBookLLNewSp <- SpatialPoints(coords = cbind(fbLL$Longitude,fbLL$Latitude),crdref) # create SpatialPoints object
spdf <- SpatialPointsDataFrame(fieldBookLLNewSp,fbLL) #create SpatialPointsDataFrame object
spdf
}else{
  crdref <- CRS(coordRefSys)
  fieldBookLLNewSp <- SpatialPoints(coords = cbind(fbLL$Longitude,fbLL$Latitude),crdref)
  spdf <- SpatialPointsDataFrame(fieldBookLLNewSp,fbLL)
  spdf
}
}
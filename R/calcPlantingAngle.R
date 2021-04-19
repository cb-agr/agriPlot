#this function takes an intial Longitude and Latitude and 

calcPlantingAngle <- function(LongLat1,LongLat2,rotation,plantingDir){
  if(rotation == "cw" && plantingDir =="N/S"){
  message("rotation = clockwise, plantingDir = N/S" )
  pi <- 3.141592654
  llcomb <- cbind(LongLat1,LongLat2)
  xInit <- llcomb[1,1]
  xNew <- llcomb[1,2]
  yInit <- llcomb[2,1]
  yNew <- llcomb[2,2]
  xDiff <- xNew - xInit
  yDiff <- yNew - yInit
  m = yDiff/xDiff
  names(m) <- "Planting Angle (degrees)"
  plantAngle <- 90-(atan(m)*180/pi)
  plantAngle <- -plantAngle
  }
  if(rotation == "ccw" && plantingDir =="N/S"){
    message("rotation = counter clockwise, plantingDir = N/S" )
    pi <- 3.141592654
    llcomb <- cbind(LongLat1,LongLat2)
    xInit <- llcomb[1,1]
    xNew <- llcomb[1,2]
    yInit <- llcomb[2,1]
    yNew <- llcomb[2,2]
    xDiff = xNew - xInit
    yDiff = yNew - yInit
    m = yDiff/xDiff
    names(m) <- "Planting Angle (degrees)"
    plantAngle <- 90+(atan(m)*180/pi)
  }
  if(rotation == "cw" && plantingDir =="E/W"){
    message("rotation = clockwise, plantingDir = E/W" )
    pi <- 3.141592654
    llcomb <- cbind(LongLat1,LongLat2)
    xInit <- llcomb[1,1]
    xNew <- llcomb[1,2]
    yInit <- llcomb[2,1]
    yNew <- llcomb[2,2]
    xDiff <- xNew - xInit
    yDiff <- yNew - yInit
    m = yDiff/xDiff
    names(m) <- "Planting Angle (degrees)"
    plantAngle <- (atan(m)*180/pi)
    plantAngle <- plantAngle
  }
  if(rotation == "ccw" && plantingDir =="E/W"){
    message("rotation = counter clockwise, plantingDir = E/W" )
    pi <- 3.141592654
    llcomb <- cbind(LongLat1,LongLat2)
    xInit <- llcomb[1,1]
    xNew <- llcomb[1,2]
    yInit <- llcomb[2,1]
    yNew <- llcomb[2,2]
    xDiff = xNew - xInit
    yDiff = yNew - yInit
    m = yDiff/xDiff
    names(m) <- "Planting Angle (degrees)"
    plantAngle <- (atan(m)*180/pi)
  }
  
  return(plantAngle)
  
}
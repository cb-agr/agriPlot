#req lib: library(foreach) 
#pivotTracksLL.R - takes longitude and latitude coordinates of a center pivot, the radius of each center pivot track and calculates latitude and longitude points for each track. Assumes center pivot is a 360 degree circle. Doesn't work for linear move systems. 
# usage: pivotrack(radin, cpLong, cpLat)
# radin is the radius of each track in meters. Values can be stored using e.g.: c(54.577,103.475,152.119,200.906,263.136,325.574,387.55) where each comma separated value represents a track radius. Radius measurements for radin should be taken as close as possible to the center of the pivot and to the end of each respective track 
# cpLong: this is longitude coordinate for the center pivot. Should be taken right at the very center of the pivot. 
# cpLat: this is latitude coordinate for the center pivot. Should be taken right at the very center of the pivot.

pivotTracksLL <- function(radin, cpLong, cpLat, matrix=TRUE){
pi <- 3.14159265359
erad <- 6378137
ptLong <- foreach(i=seq(0.5,360,0.5), .combine = 'cbind') %:% #calculate longitude for each pivot track beginning at 0.5 degrees to 360 degrees at an increment of 0.5 degrees
  foreach(j=radin, .combine = 'c') %do% { 
  cpLong + (j/erad) *(180/pi)/cos(cpLat*pi/180)*cos(i*3.14159265359/180)
  }
ptLat <- foreach(i=seq(0.5,360,0.5), .combine = 'cbind') %:% #calculate latitude for each pivot track beginning at 0.5 degrees to 360 degrees at an increment of 0.5 degrees
  foreach(j=radin, .combine = 'c') %do% { 
  cpLat + (j/erad) *(180/pi)*sin(i*3.14159265359/180)
  }
matLong <- matrix(ptLong, ncol=1) #transform matrix longitude values of pivot to a single column
matLat <- matrix(ptLat, ncol=1) #transform matrix latitude values of pivot to a single column
llcomb <- as.data.frame(cbind(matLong, matLat))
names(llcomb) <- c("Longitude",  "Latitude") 
return(llcomb)
}
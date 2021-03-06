
#req lib: library(raster)
#findIntersectingPlots.R - takes a fieldbook with plots that have a longitude/latitude and pointsOfInterest with longitude/latitude and calculates a distance matrix. 
#The distance matrix is then filtered by user-defined distance (in meters!!!) from each plot to each pointsOfInterest
#The resulting filtered matrix is then used to output a fieldbook ONLY containing plots that intersect with pointsOfInterest. 
#The final output of this program can be used to determine where to place filler/border plots that intersect with any set of points but works well with pivot tracks using pivotTracksLL

findIntersectingPlots <- function(fieldbookLL, pointsOfInterest, distance){
fb <- fieldbookLL
ptLL <- pointsOfInterest
row.names(fb) <- paste("R", 1:nrow(fb), sep="") 
fbLL <- cbind(fb$Longitude,fb$Latitude)
message("Calculating distance matrix, this may take a minute or two. FYI, this may produce a very large matrix")
gdist <- pointDistance(fbLL, ptLL, lonlat = TRUE) # pairwise distance matrix between fieldbook plot long/lat and pivot long/lat
trackint <- gdist < distance # if distance from plot to pivot point is less than distance then TRUE, else FALSE, output is boolean matrix
row.names(trackint) <- paste("R", 1:nrow(trackint), sep="") #add rownames to boolean matrix 
colnames(trackint) <-  paste("C" , 1:ncol(trackint), sep="") #add column names to boolean matrix 
x <- which(apply(trackint, 1, any)) #keep row if TRUE value exists in row, else don't keep
v <- trackint[x, ] # organize boolean matrix rowname and colname 
iwc <- intersect(rownames(v), rownames(fb)) #intersection of pivot row with plot row
rsc <- fb[rownames(fb) %in% iwc, ] #select plots that are within defined distance to pivot points 
rsc$pivotIntersection <- "Yes" #fieldbook plots that intersect with pivot tracks
return(rsc)
}

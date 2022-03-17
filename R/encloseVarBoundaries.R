# req lib: library(rgeos)
#encloseVarBoundaries.R takes fieldBookLLSPDF as input and through a series of functions generates blocks from a user-specific blocking input through a minimumb bounding geometry convex hull algorithm implemented in regeos. 

encloseVarBoundaries <- function(fieldBookLLSPDF,blocking){
fieldBookLLSPDF <- fieldBookLLSPDF
myBlocks <- blocking
fieldBookLLSPDFSplit <- split(fieldBookLLSPDF,fieldBookLLSPDF[[myBlocks]], drop=FALSE)
fieldBookLLSPDFChull <- lapply(fieldBookLLSPDFSplit, function(x){rgeos::gConvexHull(x)}) 
#fieldBookLLSPDFChull <- mapply(fieldBookLLSPDFChull, names(fieldBookLLSPDFChull), SIMPLIFY = FALSE,
                             #  FUN = function(x,y){x@polygons[[1]]@ID <- y
                              # return(x)})
#fieldBookLLSPDFChull <- do.call(rbind,fieldBookLLSPDFChull)
#fbToChullSPDF <- SpatialPolygonsDataFrame(fieldBookLLSPDFChull, data.frame(blocks = names(fieldBookLLSPDFChull)),match.ID = FALSE)
return(fieldBookLLSPDFChull)
}

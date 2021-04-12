#req libs: library(sp),library(rgeos)
#fbSPDFBoundGeom.R take a fieldBookSPDF as input produces a minimum bounding geometry polygon enclosing all plots

fbSPDFBoundGeom <- function(fieldBookLLSPDF){
spdf <- fieldBookLLSPDF
fbBoundary <- gConvexHull(spdf)
fbBoundary
}
#req libs: library(sp),library(rgeos)
#fieldBoundary.R take a fieldBookSPDF as input produces a minimum bounding geometry polygon enclosing all plots

fieldBoundary <- function(fieldBookLLSPDF){
spdf <- fieldBookLLSPDF
fbBoundary <- gEnvelope(spdf,byid = FALSE)
return(fbBoundary)
}
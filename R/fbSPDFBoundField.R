#req libs: library(sp),library(rgeos)
#fbSPDFBoundField.R take a fieldBookSPDF as input produces a minimum bounding geometry polygon enclosing all plots

fbSPDFBoundField <- function(fieldBookLLSPDF){
spdf <- fieldBookLLSPDF
fbBoundary <- gEnvelope(spdf,byid = FALSE)
return(fbBoundary)
}
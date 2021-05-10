#fbSPDFRemoveBorder.R is a simple function to remove filler/border from field book

fbSPDFRemoveBorder <- function(fieldBookLLSPDF,borderName){
  spdf <- fieldBookLLSPDF
  spdf_sub <- subset(spdf, testName!=borderName)
  return(spdf_sub)
}

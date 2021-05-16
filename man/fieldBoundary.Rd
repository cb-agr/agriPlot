\name{fieldBoundary}
\alias{fieldBoundary}
\title{
  Compute field boundary for fieldBookSPDF 
}
\description{
  This function takes a fieldBook Spatial Points Data Frame and computes a rectangular polygon that encloses all fieldBook plot points.
}
\usage{
  fieldBoundary(fieldBookLLSPDF)
}
\arguments{
    \item{fieldBookLLSPDF}{
    fieldBook Spatial Points Data Frame
  }  
}
\details{
   The function returns a field boundary from a fieldBookLLSPDF input  
}
\value{
  fieldBook boundary 
}
\examples{
  ##Vignette at https://github.com/cb-agr/agriPlot
}

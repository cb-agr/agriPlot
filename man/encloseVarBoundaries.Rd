\name{encloseVarBoundaries}
\alias{encloseVarBoundaries}
\title{
  Enclose polygon boundary for each unique variable input 
}
\description{
  This function computes a polygon boundary that encloses each unique variable (i.e. testNoRep or block). Simply put, if you want a polygon boundary for each variable associated with a specific header name, this is the function to do it. You can use it to "block" each testNoRep. The output of this function is a SpatialPolygonsDataFrame. The names features of the SpatialPolygonsDataFrame are called "blocks".
}
\usage{
  encloseVarBoundaries(fieldBookLLSPDF,variable)
}
\arguments{
    \item{fieldBookLLSPDF}{
    fieldBook Spatial Points Data Frame
  }  
    \item{variable}{
     Variable with elements to enclose
  }  
}
\details{
  This function returns polygon boundaries enclosing unique variable input. 
}
\value{
  SpatialPolygonsDataFrame with polygon boundaries enclosing unique variable input.
}
\examples{
  ##Vignette at https://github.com/cb-agr/agriPlot
}

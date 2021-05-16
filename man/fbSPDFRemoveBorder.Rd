\name{fbSPDFRemoveBorder}
\alias{fbSPDFRemoveBorder}
\title{
  Remove border plots from fieldBookLLSPDF
}
\description{
  This function takes a fieldBookLLSPDF and removes border or filler plots from the testName variable.
}
\usage{
  fbSPDFRemoveBorder(fieldBookLLSPDF,borderName)
}
\arguments{
    \item{fieldBookLLSPDF}{
    fieldBook Spatial Points Data Frame
  }  
    \item{borderName}{
    Name of border as described in testName
  }  
}
\details{
  This function returns a fieldBookLLSPDF with border plots removed
}
\value{
  fieldBook with no border plots  
}
\examples{
  ##Vignette at https://github.com/cb-agr/agriPlot
}

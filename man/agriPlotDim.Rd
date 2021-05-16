\name{agriPlotDim}
\alias{agriPlotDim}
\title{
  Calculate plot dimensions from fieldBookLL
}
\description{
  Displaying a plot as one point has some shortcommings because it doesn't account for the entire dimensions of a plot. If this is of interest, users can compute a longitude and latitude for all four corners of a plot's dimensions using agriPlotDim. The output from agriPlotDim would represent the most accurate field boundary as it accounts for plot dimensions. It should be noted that the output of this function only contains the following headers: id, block, plotRowNum, plotColumnNum, plotRows, testNameRep, Longitude, Latitude.
}
\usage{
  agriPlotDim(fieldBookLL,dims)
}
\arguments{
    \item{fieldBookLL}{
    fieldbook output from agriPlot with longitude and latitude for each plot
  }  
    \item{dims}{
     plot dimension multiplier from 0 < 1. You can think of this as how much of the plot dimensions do you want to include. A value of 1 would be the entire plot dimensions. I might recommend using 0.8 to roughly account for the alley space of a plot.
  }  
}
\details{
   The function returns individual long/lat plot dimensions for each plot in a fieldBookLL 
}
\value{
  Long/lat plot dimensions 
}
\examples{
  ##Vignette at https://github.com/cb-agr/agriPlot
}

\name{findIntersectingPlots}
\alias{findIntersectingPlots}
\title{
  Find plots that intersect that points of interest 
}
\description{
  findIntersectingPlots takes a fieldBookLL (i.e. output from agriPlot) and a given set of coordinates (i.e. pointsOfInterest) and outputs intersecting plots at a user-specified distance.
}
\usage{
  findIntersectingPlots(fieldBookLL,pointsOfInterest,distance)
}
\arguments{
    \item{fieldBookLL}{
    agriPlot fieldBook output with Longitiude and Latitude for each plot
  } 
   \item{pointsOfInterest}{
    Longitude and Latitude coordinates for points of interest. Input should be dataframe or matrix
  } 
   \item{distance}{
    the distance threshold in meters for where a plot intersects with a points of interest. Plots that have a distance less than the threshold are output as intersecting.
  } 
}
\details{
   The function returns a data frame with long/lat values for each plot in a fieldBook that intersects with pointsOfInterest based on a defined distance 
}
\value{
  Intersecting plots  
}
\examples{
  ##Vignette at https://github.com/cb-agr/agriPlot
}

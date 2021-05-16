\name{plotLeaflet}
\alias{plotLeaflet}
\title{
  Display plots in a fieldBook with leaflet 
}
\description{
  A simple function that takes a fieldBookLL (i.e. output of agriPlot) and plots the latitude and longitude points against a satellite imagery layer using Leaflet. This function is meant for quick and easy viewing of your plot points.
}
\usage{
  plotLeaflet(fieldBookLL)
}
\arguments{
    \item{fieldBookLL}{
    fieldBook with Latitude and Longitude for plots (i.e. output from agriPlot)
  } 
}
\details{
   The function returns a leaflet plot displaying long/lat points representing plots in a fieldBook
}
\value{
  leaflet plot
}
\examples{
  ##Vignette at https://github.com/cb-agr/agriPlot
}

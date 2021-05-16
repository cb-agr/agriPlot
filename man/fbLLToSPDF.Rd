\name{fbLLToSPDF}
\alias{fbLLToSPDF}
\title{
  Convert fieldBookLL to SpatialPointsDataFrame 
}
\description{
  This function takes a fieldBookLL and converts it to a Spatial Points Data Frame (i.e.SDPF) using the library spatial points. This is an important transition in the workflow as the fieldBook is now a spatial object. This allows for more advanced spatial analysis/operations to be exectuted with libraries such as raster, rgeos, etc.
}
\usage{
  fbLLToSPDF(fieldBookLL,coordRefSys)
}
\arguments{
    \item{fieldBookLL}{
    agriPlot fieldBook output with Longitiude and Latitude for each plot
  } 
   \item{coordRefSys}{
    this the coordinate reference system (CRS) you wish to assign to your Spatial Points Data Frame. Using coordRefSys = "default" sets the CRS to: "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs". Otherwise, users can enter any valid CRS.
  } 
}
\details{
   The function returns a Spatial Points Data Frame from a fieldBookLL input 
}
\value{
  fieldBookLL as Spatial Points Data Frame
}
\examples{
  ##Vignette at https://github.com/cb-agr/agriPlot
}

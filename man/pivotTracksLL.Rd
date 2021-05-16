\name{pivotTracksLL}
\alias{pivotTracksLL}
\title{
  Calculate longitude and latitude points for a each center pivot track 
}
\description{
  This function takes the radius of each center pivot track, the Longitude and Latitude of the center pivot and calculates latitude and longitude points for each respective track. Assumes center pivot is a 360 degree circle. Can be used as input for findIntersectingPlots to determine which plots intersect with pivot tracks.
}
\usage{
  pivotTracksLL(radin, cpLong, cpLat)
}
\arguments{
    \item{radin}{
    The radius of each pivot track in meters. Values can be stored using e.g.: c(54.577,103.475,152.119,200.906,263.136,325.574,387.55) where each comma separated value represents a track radius. Radius measurements for radin should be taken as close as possible to the center of the pivot stop and to the end of each respective track.
  } 
   \item{cpLong}{
    This is longitude coordinate for the center pivot. Should be taken right at the very center of the pivot stop
  } 
   \item{cpLat}{
    This is latitude coordinate for the center pivot. Should be taken right at the very center of the pivot stop.
  } 
}
\details{
   The function returns a data frame with long/lat values for each center pivot track 
}
\value{
  long/lat values for center pivot tracks 
}
\examples{
  ##Vignette at https://github.com/cb-agr/agriPlot
}

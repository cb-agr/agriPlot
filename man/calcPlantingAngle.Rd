\name{calcPlantingAngle}
\alias{calcPlantingAngle}
\title{
  Calculate planting angle based on an initial and terminal longitude and longitude. 
}
\description{
  Calculates planting angle based on an initial longitude and longitude, terminal longitude and latitude, direction of rotation and planting direction.
}
\usage{
  calcPlantingAngle(LongLat1,LongLat2,rotation,plantingDir)

}
\arguments{
  \item{LongLat1}{
    this is the initial longitude and latitude of where you plan to begin planting. Values should be stored as c(-98.1878745,40.8915224).
  }
  \item{LongLat2}{
    the is the terminal longitude and latitude for where your first planting row will end. Values should be stored as c(-98.1878745,40.8915224).
  }
  \item{rotation}{
    direction you will be rotating field. There are one of two inputs to select from (arguments must be in quotes): "cw" - clockwise, "ccw" - counter-clockwise
  }
  \item{plantingDir}{
    the direction you will be planting. There are one of two inputs to select from: "N/S" - north/south planting direction, "E/W" - east/west planting direction
  }
}
\details{
  The function returns a planting angle based on initial and terminal long/lat
}
\value{
  planting angle in degrees
}
\examples{
  ##see Vignette at https://github.com/cb-agr/agriPlot
}

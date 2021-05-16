\name{agriPlot}
\alias{agriPlot}
\title{
  Calculate latitude and longitude coordinates for each plot represented in a fieldBook. 
}
\description{
  agriPlot is the core function that serves as input for all of the other functions outlined here. The input is a user fieldBook with specified header names. Users just have to enter a handful of inputs and agriPlot will output a latitude and longitude for each plot in your fieldBook. This output will be referred to as fieldBookLL.
}
\usage{
  agriPlot(fieldBook,initialLong,initialLat,rowSpacing,plotLength,rowColDir,plantingAngle)

}
\arguments{
  \item{fieldBook}{
    fieldBook representing agricultural field experiment. Must have necessary header names. either data.frame or data.table.
  }
  \item{initialLong}{
    The Longitude for the plot in column 1 and row 1
  }
  \item{initialLat}{
    The Latitude for the plot in column 1 and row 1
  }
  \item{rowSpacing}{
    This is the row spacing of your planter in meters (15 inch planter spacing = 0.381 meters, 30 inch planter spacing = 0.762 meters).
  }
  \item{plotLength}{
    This is the total length of your plot in meters. This includes the planted portion of the plot and the alley (if an alley is applicable).
  }
  \item{rowColDir}{
    The row and column orientation of your field. For North/South plantings: The first two letters before the hyphen represent the row direction in which your row numbers are increasing. The second two letters following the hyphen represent represent the column direction in which your column numbers are increasing - "SN-WE", "SN-EW", "NS-WE", "NS-EW". For East/West plantings: The first two letters before the hyphen represent the column direction in which your column numbers are increasing. The second two letters following the hyphen represent represents the row direction in which your row numbers are increasing - "WE-SN", "WE-NS", "EW-SN", "EW-NS".
  }
  \item{plantingAngle}{
    The angle you planted at. Values greater than 0 rotate your field in a counterclockwise direction and values less than 0 rotate your field in a clockwise direction. If you planted "perfectly" vertical or horizontal then your plantingAngle is 0. 
  }
}
\details{
  The function returns latitude and longitude coordinate for each plot represented in a fieldBook.
}
\value{
  Latitude and longitude coordinate for each plot
}
\examples{
  ##see Vignette at https://github.com/cb-agr/agriPlot
}

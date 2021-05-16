\name{demoFieldBook}
\alias{demoFieldBook}
\title{
  Make a demo fieldBook
}
\description{
  Generates a simple "demo" fieldbook from a specified number of rows, columns and plot rows. In some instances a user may not have a fieldbook quite yet prepared for the season but still may want the option for a preliminary visualization their field trial layout. The output of this function is only intended to be used with agriDemoplot (explained after this function).
}
\usage{
  demoFieldBook(beginRow,endRow,beginColumn,endColumn,plotRows)

}
\arguments{
  \item{beginRow}{
    The row value you start at. Must be an integer.
  }
  \item{endRow}{
    The row value you end at. Must be an integer.
  }
  \item{beginColumn}{
    The column value you start at. Must be an integer.
  }
  \item{endColumn}{
    The column value you end at. Must be an integer.
  }
  \item{plotRows}{
    Number of plots per row associated with the specified rows and columns. Must be an integer.
  }
}
\details{
  The function returns a demoFieldBook that users can use with agriDemoPlot
}
\value{
  demoFieldBook 
}
\examples{
  ##Vignette at https://github.com/cb-agr/agriPlot
}

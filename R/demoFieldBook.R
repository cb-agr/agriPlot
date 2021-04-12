#req lib: library(data.table)
#this function takes a user defined number of rows and columns representing a field experiment and plot rows and outputs a "demo" field book. 
#The output from this function can be used for input to the agriDemoPlot.R function that will assign Longitude and Latitude to each plot
demoFieldBook <- function(beginRow,endRow,beginColumn,endColumn,plotRows){
  rows = beginRow:endRow
  cols = as.data.table(beginColumn:endColumn)
  x <- apply(cols, 1, function(x) data.table(plotRowNum=rows,plotColumNum=x))
  myRowCols = do.call(rbind,x)
  myRowCols$plotRows = plotRows
  myRowCols
}

#req lib: library(leaflet)
#fbLLPlotLeaflet.R takes a fieldbook with long/lat as input (i.e.output from agriPlot.R or agriDemoPlot.R) and displays each respective plot long/lat against satellite imagery using the R leaflet package. The purpose is for quick and easy viewing of plots. 

fbLLPlotLeaflet <- function(fieldBookLL){
ll <- as.data.frame(cbind(fieldBookLL$Longitude,fieldBookLL$Latitude))
names(ll) <- c("Longitude","Latitude") 
m <- leaflet(ll) %>%
  addProviderTiles(providers$Esri.WorldImagery) %>%  
  addCircleMarkers(lng=~Longitude, lat=~Latitude, radius=0.5,stroke=FALSE,fillOpacity = 1, color = "orange" ) %>%
  addMeasure()
m
}
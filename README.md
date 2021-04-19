# agriPlot

Practical geospatial tools for agricultural field research planning and analysis

## What is agriPlot? 

The core R function of agriPlot (i.e. agriPlot.R) takes a fieldbook comprising an agricultural research experiment with a row column design and computes a latitude and longitude for each plot (i.e. entry) represented in the fieldbook. Once geographical coordinates are assigned to individual plots, agriPlot has numerous easy-to-use R functions for downstream analysis and visualization of a users field experiment. For instance, users may find agriPlot useful for evaluating the layout of their respective trial against satellite imagery or generate a map to bring to the field with them to mark field boundaries. agriPlot does NOT design agricultural field experiments. That’s left up to the user.

## What is a fieldBook?

A fieldbook represents some agricultural field research experiment wherein the row and column for every plot has a corresponding test or treatment and may also contain any other important attribute. A row column design can practically be thought of as a coordinate system to delineate tests or treatments being evaluated and it is also commonly used to navigate research fields. In theory, agriPlot can accept any agricultural field research design so long as it is in a row column format. From there, if the initial latitude and longitude is known for the plot in row 1 and column 1, the remaining coordinates for every plot can be calculated using a handful of other inputs. Once we know all of the plot coordinates, many geospatial operations can be carried out for subsequent analysis. 

## Accuracy

The analysis performed by all the functions is very accurate. However, when using this program, it should be important that results are ground-truthed before final implementation of a field design. 

## Documentation

#### fieldBook input:

Your fieldbook input can have any number of attributes but there are a handful of header names that are **essential** for agriPlot to work.

plotRowNum: contains your fieldbook row numbers associated with each respective plot. Must be an integer.

- Rows always go in the **Latitudinal** or **Y** direction

plotColumnNum: contains your fieldbook column numbers associated with each respective plot. Must be an integer. 

- Columns always go in the **Longitudinal** or **X** direction

plotRows: this is the number of rows per plot. This might be a 2-row, 4-row or 6-row plot, etc. agriPlot.R can handle any combination of plotRows for a field. Must be an integer.
testName: corresponding name of the test or treatment associated with the row/column you're evaluating. A testName for instance might called highProtein, representing soybean lines you're evalauting. Please don't allow for any whitespace in the testName. Can be numeric, character or alphanumeric. 
repNum: the rep number associated with the testName (i.e. 1,2,3). Must be integer. 
block: block associated with each testName. If not applicable to your field design include the header but leave column blank.  

argiPlot.R

**Description**

agriPlot.R is the core function that serves as input for all of the other functions outlined here. The input is a user fieldBook with specified header names. Users just have to enter a handful of inputs and agriPlot.R will calculate a latitude and longitude for each plot in your fieldBook.

**usage**

```R
agriPlot(fieldBook,initialLong,initialLat,rowSpacing,plotLength,rowColDir,plantingAngle)
```

**Arguments**
fieldBook: either dataframe or datatable. fieldBook must have necessary header names.
initialLong: the Longitude for the plot in column 1 and row 1.
initialLat: the Latitude for the plot in column 1 and row 1.
rowSpacing: this is the row spacing of your planter in **meters** (15 inch planter spacing = 0.381 meters, 30 inch planter spacing = 0.762 meters).  
plotLength: this is the **total** length of your plot in **meters**. This includes the planted portion of the plot and the alley (if an alley is applicable).
rowColDir: this is the row and column orientation of your field. I apologize as this is probably the most confusing part of the function, but let me explain.

For North/South plantings:
The first two letters before the hyphen represent the row direction in which your row numbers are increasing. The second two letters following the hyphen represent represents the column direction in which your column numbers are increasing. The are one of four North/South planting inputs to choose from.

- SN-WE – row numbers increase from South to North and column numbers increase from West to East
- SN-EW – row numbers increase from South to North and column numbers increase from East to West
- NS-WE – row numbers increase from North to South column numbers increase from West to East
- NS-EW – row numbers increase from North to South and column numbers increase from East to West 

![Planting](/Users/christopherbach/Downloads/row_col_SNWE.svg "SN-WE planting")

For East/West plantings:
The first two letters before the hyphen represent the column direction in which your column numbers are increasing. The second two letters following the hyphen represent represents the row direction in which your row numbers are increasing. The are one of four East/West inputs to choose from.

- WE-SN – column numbers increase from West to East and row numbers increase from South to North
- WE-NS – column numbers increase from West to East and row numbers increase from North to South
- EW-SN – column numbers increase from East to West and row numbers increase from South to North
- EW-NS – column numbers increase from East to West and row numbers increase from North to South

plantingAngle: The angle you planted at. Values greater than 0 rotate your field in a counterclockwise direction and values less than 0 rotate your field in a clockwise direction. If you planted "perfectly" vertical or horizontal then your plantingAngle is 0. I recommend using calcPlantingAngle.R to find your planting angle. 

Examples:

```R
fbLL <- agriplot(my2021FieldBook,-98.13135,40.89407,0.762,4,"SN-WE",0)
```

demoFieldBook.R:

**Description**
    Generates a simple "demo" fieldbook from a specified number of rows, columns and plot rows. In 	some instances a user may not have a fieldbook quite yet prepared for the season but still may want the option for a preliminary visualization their field trial layout. The output of this function is only intended to be used with agriDemoplot.R (explained after this function).

**Usage**

```R
demoFieldBook(beginRow,endRow,beginColumn,endColumn,plotRows)
```

beginRow: the row value you wish to start at. Must be integer.
endRow: the row value you wish to end at. Must be integer.
beginColumn: the column value you wish to start at. Must be integer.
endColumn: the column value you wish to end at. Must be integer.
plotRows: number of plots per row associated with the specified rows and columns. Must be integer.

**Examples**

```R
demoFB <- demoFieldBook(1,50,1,18,2)
```

Handling multiple plotRows:

```R
demoFBList <- list(A=demoFieldBook(1,50,1,6,2),B=demoFieldBook(1,50,7,12,4),C=demoFieldBook(1,50,13,18,2))
demoFB <- do.call(rbind,demoFBList)
```

#### agriDemoPlot.R

**Description**

agriDemoplot.R is virtually the same function as agriPlot.R, however, it's only meant to take a fieldbook generated from demoFieldBook.R as input. agriDemoplot.R can take the output from demoFieldBook.R as is. To limit redundancy in the README please refer agriPlot.R for explaination of the agrguments. 

**Usage**

```R
agriDemoPlot(fieldBook,initialLong,initialLat,rowSpacing,plotLength,rowColDir,plantingAngle)
```

**Examples**

```R
demoFB <- demoFieldBook(1,50,1,18,2)
demoFBLL <- agriDemoPlot(demoFB,-98.13135,40.89407,0.762,4,"SN-WE",0)
```

fbLLPlotLeaflet.R

**Description**

fbLLPlotLeaflet.R is a simple function that takes the output of agriPlot.R or agriDemoPlot.R and plots the latitude and longitude points against satellite imagery using Leaflet. This function is meant for quick and easy viewing of your plot points.

**Usage**

```R
fbLLPlotLeaflet(fieldBookLL)
```

**Arguments**

fieldBookLL: fieldBook with Latitude and Longitude for plots 

**Example**

```R
leafletPlot <- fbLLPlotLeaflet(fieldBookLL)
```

The next two functions assist with identifying row columns in your fieldbook that intersect with center pivot tracks. Mapping a field into pivot tracks can be challenging but these functions can help with determining where to place filler/border in pivot tracks. Use these functions in the order described. 

pivotTracksLL.R

**Description**

This function takes the radius of each center pivot track (i.e. span), the Longitude of the center pivot and the latitude of the center pivot and calculates latitude and longitude points for each respective track. Assumes center pivot is a 360 degree circle.

**Usage**

```R
pivotTracksLL(radin, cpLong, cpLat, matrix=TRUE)
```

**Arguments**

radin: is the radius of each track in meters. Values can be stored using e.g.: c(54.577,103.475,152.119,200.906,263.136,325.574,387.55) where each comma separated value represents a track radius. Radius measurements for radin should be taken as close as possible to the center of the pivot stop and to the end of each respective track 
cpLong: this is longitude coordinate for the center pivot. Should be taken right at the very center of the pivot stop. 
cpLat: this is latitude coordinate for the center pivot. Should be taken right at the very center of the pivot stop.
matrix = TRUE: specifying matrix = TRUE will serve as the input for pivotPlotsIntersection.R. However, if you want to view your pivot track points against satellite imagery to check their accuracy use matrix = FALSE, this will output a dataframe. 

**Examples**

```R
pivotLL <- pivotTracksLL(c(54.577,103.475,152.119,200.906,263.136,325.574,387.55), -98.13135,40.89407, matrix=TRUE)
```

pivotPlotsIntersection.R

**Description**

pivotPlotsIntersection.R takes the output from agriPlot.R and pivot track points from pivotTracksLL.R and returns plots that intersect with pivot tracks based a user-defined distance. The output from pivotPlotsIntersection.R is basically a subset of your fieldBook plots that intersect with pivot tracks.

**Usage**

```R
pivotPlotsIntersection(fieldbookLL,pivotTracksLL,distance)
```

**Arguments**

fieldbookLL: agriPlot.R fieldBook output with Longitiude and Latitude for each plot 
pivotTracksLL: pivot track points output from pivotTracksLL.R.
distance: the distance threshold in meters for where a plot intersects with a pivot point.  

**Examples**

```R
fbLLintersection <- pivotPlotsIntersection(fbLL,pivotLL,3)
```

```R
fbLL <- agriplot(my2021FieldBook,-98.13135,40.89407,0.762,4,"SN-WE",0)
pivotLL <- pivotTracksLL(c(54.577,103.475,152.119,200.906,263.136,325.574,387.55), -98.13135,40.89407, matrix=TRUE)
fbLLintersection <- pivotPlotsIntersection(fbLL,pivotLL,3)
```

fbLLToSPDF.R

**Usage**

```R
fbLLToSPDF(fieldBookLL,coordRefSys)
```

**Description**
This function takes a fieldBook containing Long/Lat (output from agriPlot.R) and converts it to a Spatial Points Data Frame (i.e.SDPF) using the library sp. This is an important transition in the workflow as the fieldBook is now a spatial object, which allows for more advanced spatial analysis/operations to be exectuted. 

**Arguments**

fieldBookLL: agriPlot.R fieldBook output with Longitiude and Latitude for each plot
coordRefSys: this the coordinate reference system (CRS) you wish to assign to your Spatial Points Data Frame. Setting coordRefSys = "default" sets the CRS to "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs". Otherwise users can enter any valid CRS.

**Examples**

```R
fbSPDF <- fbLLToSPDF(my2021FBLL,coordRefSys="default")
```

Example using other CRS:

```R
fbSPDF <- fbLLToSPDF(my2021FBLL,coordRefSys="EPSG:1999")
```

fbSPDFBoundGeom.R

**Description**

this is a fairly simple function that takes a fieldBook Spatial Points Data Frame and runs it through a minimum bounding geometry function to create a field boundary.

**Usage**

```R
fbSPDFBoundGeom(fieldBookLLSPDF)
```

**Arguments**

fieldBookLLSPDF: fieldBook as Spatial Points Data Frame

**Examples**

```R
fbBoundGeom <- bSPDFBoundGeom(fbSPDF)
```

fbSPDFBoundGeom.R

**Usage**

```R
fbSPDFBoundGeom(fieldBookLLSPDF,blocking)
```

**Description**

This function computes a polygon for each test/block in your fieldBook using a specified blocking criteria.  

**Arguments**

fieldBookLLSPDF: fieldBook as Spatial Points Data Frame
blocking: field to block by

**Usage**

myBlocks <- fbSPDFBoundGeom(fieldBookLLSPDF,"testNoRep")

agriPlotBuffer.R

**Description**

For a slightly more accurate representation of a field trial we can compute a longitude and latitude for all four corners of a plot's demensions using agriBufferPlot.R.

**Usage**

```R
agriPlotBuffer(fieldBookLL,buffer)
```

**Arguments**

fieldBookLL: fieldbook output from agriPlot.R with longitude and latitude for each plot
buffer: value from > 0 to 1 to add dimensions to plot longitude and latitude

**Examples**

```R
myFBBuffer <- agriPlotBuffer(fbLL,0.8)
```

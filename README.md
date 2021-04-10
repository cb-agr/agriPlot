# agriPlot
Practical geospatial tools for agricultural field research planning and analysis

# What is agriPlot? 
The core R function of agriPlot takes a fieldbook comprising an agricultural research experiment with a row column design and computes a latitude and longitude for each plot (i.e. entry) represented in the fieldbook. Once coordinates are assigned to individual plots, many geospatial operations can be carried out for subsequent analysis.

# Why use a fieldbook? 

A fieldbook represents some agricultural field research experiment wherein the row and column for every plot has a corresponding test or treatment and may also contain any other important attribute. A row column design can practically be thought of as a coordinate system to delineate tests or treatments being evaluated and it is also commonly used to navigate research fields. In theory, agriPlot can accept any agricultural field research design so long as it is in a row column format. From there, if the initial latitude and longitude is known for the plot in row 1 and column 1, the remaining coordinates for every plot can be calculated using a handful of other inputs. Once coordinates are assigned to individual plots, many geospatial operations can be carried out for subsequent analysis. 

# What agriPlot is not
agriPlot does NOT design agricultural field experiments. That’s left up to the user. 

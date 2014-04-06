This package builds on [Mike Bostock's CLI topojson utility](https://github.com/mbostock/topojson/wiki/Command-Line-Reference) to transform any R SpatialPolygonDataFrame into a TopoJSON file. This is for example intended to then use [Ramnath Vaidyanathan's rMaps](https://github.com/ramnathv/rMaps) to draw interactive maps. 

To install this small package, you can run:

```
library(devtools)
install_github("joelgombin/toTopoJSON")
```

Then, you can convert any SPDF into a topojson file by running:

```
toTopoJSON(list(shapefile=shapefile),simplification=0.95, quantisation="1e3", width=460, height=460, id="ID")
```

Please refer to the help for more details about the options. This package is at a very alpha stage, so don't hesitate to send [pull requests](https://github.com/joelgombin/toTopoJSON/pulls). Please report any issue to the [issue tracker](https://github.com/joelgombin/toTopoJSON/issues).
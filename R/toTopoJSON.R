#' Transform one or several SpatialPolygonsDataFrame into a TopoJSON file
#'
#' \code{toTopoJSON} takes one or several \code{SpatialPolygonsDataFrame} objects and creates a topojson file, multi-layered if needed. This functions needs the \code{topojson} CLI utility to be installed (see \link{https://github.com/mbostock/topojson/wiki/Installation}). 
#' 
#' @param SPDF a named list of \code{SpatialPolygonsDataFrame} objects. The names of the list elements need to be the same as the names of the SPDF objects.
#' @param path the path where the topojson file should be registered. By default, the working directory.
#' @param filename the name of the topojson file, without extension. By default, the name of the first SPDF object.
#' @param simplification the geometry simplification factor. A numeric between 0 and 1, 0 being the maximum simplification, 1 retaining all the subtleties of the geometries. See \link{https://github.com/mbostock/topojson/wiki/Command-Line-Reference} for more details.
#' @param quantisation maximum number of differentiable points along either dimension. 
#' @param width width of the desired output (in pixels)
#' @param height height of the desired output (in pixels)
#' @param properties the names of the properties of the SPDFs to be exported to the topojson file. A vector of character strings. If NULL (the default), all columns of the SPDFs dataframes. If "", no properties are included in the TopoJSON file.
#' @param id the name of the SPDF column used as ID. By default, no ID. 
#' 
#' @return Nothing. As a side effect, a topojson file is created. 
#' @export
#' @references Mike Bostock's wiki: \link{https://github.com/mbostock/topojson/wiki}.

toTopoJSON <- function(SPDF, path=getwd(), filename=NULL, simplification=1, quantisation="1e4", width=800, height=400, properties=NULL, id=NULL) {
  require(rgdal)
  tmpdir <- tempdir()
  if (is.null(filename)) filename <- names(SPDF)[1]
  setCPLConfigOption("SHAPE_ENCODING", "UTF-8")
  lapply(names(SPDF), function(x) {
    writeOGR(get(x), dsn=tmpdir, layer=x, driver="ESRI Shapefile", overwrite_layer=TRUE)
  })  
  call <- paste("topojson -o '", path,"/", filename,".json' -q ",as.character(quantisation) , ifelse(is.null(id), "", paste0(" --id-property ", id))  , " -s ", simplification," --width ",width," --height ", height, " --shapefile-encoding utf8", ifelse(is.null(properties), " -p", ifelse(paste(properties, collapse="") %in% "", "", paste(" -p", properties, collapse=""))), " -- ", paste("'", tmpdir, "/", names(SPDF), ".shp'",sep="", collapse=" "),  sep="")
  cat(call)
  cat("\n")
  system(call)
}
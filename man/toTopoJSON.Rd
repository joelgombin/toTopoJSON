\name{toTopoJSON}
\alias{toTopoJSON}
\title{Transform one or several SpatialPolygonsDataFrame into a TopoJSON file}
\usage{
toTopoJSON(SPDF, path = getwd(), filename = NULL, simplification = 1,
  quantisation = "1e4", width = 800, height = 400, properties = NULL,
  id = NULL)
}
\arguments{
  \item{SPDF}{a named list of
  \code{SpatialPolygonsDataFrame} objects. The names of the
  list elements need to be the same as the names of the
  SPDF objects.}

  \item{path}{the path where the topojson file should be
  registered. By default, the working directory.}

  \item{filename}{the name of the topojson file, without
  extension. By default, the name of the first SPDF
  object.}

  \item{simplification}{the geometry simplification factor.
  A numeric between 0 and 1, 0 being the maximum
  simplification, 1 retaining all the subtleties of the
  geometries. See
  \link{https://github.com/mbostock/topojson/wiki/Command-Line-Reference}
  for more details.}

  \item{quantisation}{maximum number of differentiable
  points along either dimension.}

  \item{width}{width of the desired output (in pixels)}

  \item{height}{height of the desired output (in pixels)}

  \item{properties}{the names of the properties of the
  SPDFs to be exported to the topojson file. A vector of
  character strings. If NULL (the default), all columns of
  the SPDFs dataframes. If "", no properties are included
  in the TopoJSON file.}

  \item{id}{the name of the SPDF column used as ID. By
  default, no ID.}
}
\value{
Nothing. As a side effect, a topojson file is created.
}
\description{
\code{toTopoJSON} takes one or several
\code{SpatialPolygonsDataFrame} objects and creates a
topojson file, multi-layered if needed. This functions
needs the \code{topojson} CLI utility to be installed (see
\link{https://github.com/mbostock/topojson/wiki/Installation}).
}
\references{
Mike Bostock's wiki:
\link{https://github.com/mbostock/topojson/wiki}.
}


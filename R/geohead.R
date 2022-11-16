#' Geospatial computation script header
#' @export
geohead <- function(){
return(
  cat(
  '
  {
    rm(list=objects())
    this_fp <- function(){return(rstudioapi::getActiveDocumentContext()$path)}
    this_dir <- function(){return(dirname(this_fp()))}
    setwd(this_dir())
  }
  {
    require(rgdal)
    require(sf)
  }
  {
    list.files()
  }
  '
  )
)  
}


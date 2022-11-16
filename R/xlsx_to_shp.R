#' template for converting an xlsx file to a shapefile
#' @export
xlsx_to_shp <- function(){
return(
cat(
'
{
  rm(list=objects())
  this_fp <- function(){return(rstudioapi::getActiveDocumentContext()$path)}
  this_dir <- function(){return(dirname(this_fp()))}
  setwd(this_dir())
}
data_loc <- readxl::read_xlsx("input/Location_063022.xlsx")
well_data <- data.frame(
  x = data_loc$Easting,
  y = data_loc$Northing,
  well = data_loc$Location
)
well_data <- dplyr::distinct(well_data)
well_data <- well_data[!is.na(well_data$x),]
well_data <- dplyr::arrange(well_data, well)
library(rgdal)
library(sf)
sf_out <- st_as_sf(well_data, coords = c("x", "y"), crs = CRS("+init=epsg:2926"))
st_write(sf_out, "../Shapefiles/well_locations.shp")'
)
)
}
#' prints template for writing to a shapefile using terra
#' @export
write_shp <- function(){
return(
cat(
'library(terra)
filename <- system.file("ex/lux.shp", package="terra")
basename(filename)
s <- vect(filename)
outfile <- "shp_test.shp"
writeVector(s, outfile, overwrite=TRUE)'
)
)
}
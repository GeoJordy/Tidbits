#' template for plotting to graphics window 
#' @export
plot_window <- function(){
return(cat(
'windows(width = 2550, height = 3300)
plot(1:10, 1:10)
dev.off()'
)
)
}
#' template for plotting to png  
#' @export
plot_png <- function(){
return(cat(
'png(filename="temp2.png", pointsize=50, width = 2550, height = 3300)
plot(1:10, 1:10)
dev.off()'  
))
}

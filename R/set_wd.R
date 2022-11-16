#' prints template for fetching the directory associated with a given file
#' @export
set_wd <- function(){
return(
cat(
' rm(list=objects())
  this_fp <- function(){return(rstudioapi::getActiveDocumentContext()$path)}
  this_dir <- function(){return(dirname(this_fp()))}
  setwd(this_dir())'
)
)
}
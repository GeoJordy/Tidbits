#' prints template for fetching the directory associated with a given file
#' @export
this_fp <- function(){
return(
cat(
'this_fp <- function(){return(rstudioapi::getActiveDocumentContext()$path)}
this_dir <- function(){return(dirname(this_fp()))}'
)
)
}
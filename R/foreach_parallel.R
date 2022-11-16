#' prints template for parallel computation
#' @export
foreach_parallel <- function(){
return(cat(
'{
  f <- function(i){
    Sys.sleep(5)
    x <- sqrt(i)
    save(x, file = paste0("C:\\Users\\Jordy.Bernard\\OneDrive - Geosyntec\\Desktop\\Rdata\\dat", i, ".Rdata"))
  }
  a <- Sys.time()
  library(foreach)
  library(doParallel)
  registerDoParallel(14)
  foreach (i=1:14) %dopar% {
    f(i)
  }
  print(Sys.time()-a)
}'  
))}

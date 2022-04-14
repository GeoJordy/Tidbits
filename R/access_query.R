#' prints template for connecting R to Microsoft Access
#' @export
access_query <- function(){
return(cat(
"rm(list=objects())
root <- 'D:\\GeoJordy\\Projects\\Milton_MK'
setwd(root)
library(RODBC)
con <- odbcDriverConnect('Driver={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=data/PW0247A Database.mdb')
tab <- sqlQuery(con, 'select * from Data')"
)
)
}


#' rsql template
#' @export
rsql <- function(){
return(cat(
"
dat_in <- readxl::read_xlsx('C:\\Users\\Jordy\\OneDrive\\Desktop\\PH-RM2E_PAH_PCB_ALL_041822.xlsx', sheet = 1)
library(sqldf)
QUERY <- sqldf('SELECT CHEMICAL_NAME, CAS_RN, RESULT_NUMERIC, RESULT_UNIT, REPORT_RESULT_VALUE, REPORT_RESULT_UNIT, DETECT_FLAG, METHOD_DETECTION_LIMIT
                FROM dat_in 
                WHERE CAS_RN in (`53469-21-9`, `12672-29-6`, `11097-69-1`, `11096-82-5`) AND MATRIX_CODE in (`SE`, `SEDIMENT`)
                ORDER BY CHEMICAL_NAME')
"
)
)
}


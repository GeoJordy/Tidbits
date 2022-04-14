#' prints template for creating and navigating about Viewports using grid
#' @export
grid <- function(){
return(cat(
'# open plotting window #
dev.new()
xlim <- c(0,100)
ylim <- c(0,100)
margin <- 1/10
jjust <- function(just){
  if(just=="c"){
    new_just <- "center"
  }else if (just=="tl"){
    new_just <- c(1,0)
  }else if (just=="tr"){
    new_just <- c(0,0)
  }else if (just=="bl"){
    new_just <- c(1,1)
  }else if (just=="br"){
    new_just <- c(0,1)
  }
  return(new_just)
}
require(grid)
grid.newpage()
xdif <- xlim[2]-xlim[1]
ydif <- ylim[2]-ylim[1]
xmar <- xdif*margin
ymar <- ydif*margin
pushViewport(
  viewport(
    xscale = c(xlim[1]-xmar, xlim[2]+xmar), 
    yscale = c(ylim[1]-ymar, ylim[2]+ymar),
    name="vp0"
  )
)
grid.rect(gp=gpar(fill="black"))
pushViewport(
  viewport(
    x = unit(xmar/(xdif+2*xmar), "npc"),
    y = unit(ymar/(ydif+2*ymar), "npc"),
    height = unit(xdif/(xdif+2*xmar), "npc"),
    width = unit(ydif/(ydif+2*ymar), "npc"),
    xscale = c(xlim[1], xlim[2]), 
    yscale = c(ylim[1], ylim[2]), 
    name="vp1",
    just=jjust("tr")
  )
)
grid.rect(gp=gpar(fill=rgb(0,0.5,0.5,0.5)))
grid.lines(
  x = unit(c(0, 1), "npc"),
  y = unit(c(0, 1), "npc"),
  default.units = "npc",
  arrow = NULL, name = NULL,
  gp=gpar(), draw = TRUE, vp = NULL
)'
))
}

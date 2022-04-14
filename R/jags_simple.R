#' prints basic Jags template
#' @export
jags_simple <- function(){
return(cat(
"library(jagsUI)
library(jagshelper)
b0 <- 0
b1 <- .4
n <- 10
x <- rnorm(n, 3, 5)
p <- exp(b0+b1*x)/(1+exp(b0+b1*x))
y <- rep(NA, n)
for(i in 1:n){
  y[i] <- rbinom(1,1,p[i])
}
jags_data <- list(n=10, y=y, x=x)
cat(
  'model {
    for(i in 1:n) {
      y[i] ~ dbern(p[i])
      p[i] <- exp(b0+b1*x[i])/(1+exp(b0+b1*x[i]))
    }
  b0 ~ dnorm(0, 0.001)
  b1 ~ dnorm(0, 0.001)
  }', 
  file='jags_model'
)
niter <- 10000
ncores <- 3
start_time <- Sys.time()
jags_out <- jagsUI::jags(model.file='jags_model', 
                         data=jags_data,
                         parameters.to.save=c('b0','b1','p'),
                         n.chains=ncores, 
                         parallel=T, 
                         n.iter=niter,
                         n.burnin=niter/2, 
                         n.thin=niter/2000)
print(Sys.time() - start_time)
post_df <- jags_df(jags_out)
b <- pull_post(post_df, 'b')
b"
))
}
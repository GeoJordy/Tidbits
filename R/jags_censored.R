#' prints template for handling censored data in jags
#' @export
jags_censored <- function(){
return(cat(
"rm(list=objects())
library(jagsUI)
library(jagshelper)
# pack up jags data
{
  n_d <- 20 # number of detects
  n_nd <- 10 # number of non-detects
  Y_detect <- runif(n_d, min=5, max=20)
  DL <- rep(5, n_nd)
  lim <- cbind(0, DL)
  R <- rep(1, n_nd)
  jags_data <- list(n_d=n_d, n_nd=n_nd, Y=Y_detect, lim=lim, R=R)
}
cat(
  'model{ # Model 1
    for (i in 1:n_d){
      Y[i] ~ dnorm(mu, tau)
    }
    for (i in 1:n_nd){
      R[i] ~ dinterval(Z[i], lim[i,])
      Z[i] ~ dnorm(mu, tau)
    }
    mu ~ dnorm(0, 0.01)
    tau <- pow(1/sig, 2)
    sig ~ dexp(0.01)
  }', 
  file='jags_model'
)
niter <- 10000
ncores <- 3
start_time <- Sys.time()
jags_out <- jagsUI::jags(model.file='jags_model', 
                         data=jags_data,
                         parameters.to.save=c('mu', 'sig'),
                         n.chains=ncores, 
                         parallel=F, 
                         n.iter=niter,
                         n.burnin=niter/2, 
                         n.thin=niter/2000)
print(Sys.time() - start_time)
post_df <- jags_df(jags_out)
mu <- pull_post(post_df, 'mu')
sig <- pull_post(post_df, 'sig')"
))
}
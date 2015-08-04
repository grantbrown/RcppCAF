\name{RcppCAF-package}
\alias{RcppCAF-package}
\docType{package}
\title{RcppCAF - A package to facilitate the use of actor patterns in Rcpp programming.}
\description{The \href{C++ Actor Framework}{www.actor-framework.org} (CAF)
is a useful library providing an efficient implementation of \href{actor model}{https://en.wikipedia.org/wiki/Actor_model}
parallelism to C++ programming. This package aims to provide an easy way for users of the
excellent \link{Rcpp}{http://www.rcpp.org/} R package to employ CAF in their own
C++ code}
\details{
  Currently, very little of CAF is exposed to R, and the library is most 
  effectively used in Rcpp package development. This may change in the future, 
  however the process based parallelism provided by packages like \pkg{parallel}
  and \pkg{snow} is safer approach for parallel computing with R objects. Even
  on the C++ side, users should employ the tools provided by \pkg{RcppEigen} rather
  than the default \pkg{Rcpp} wrapper classes. 

  To illustrate a basic example of actor model programming, we have implemented
  the \code{\link{CAFdist}} function, which provides a parallel implementation
  of the base \code{\link{CAFdist}} function. 
  \tabular{ll}{
    Package: \tab RcppCAF\cr
    Type: \tab Package\cr
    Version: \tab 0.01\cr
    Date: \tab 2015-08-04\cr
    License: \tab GPL-3\cr}}
\references{Dirk Eddelbuettel and Romain Francois (2011). \pkg{Rcpp}: Seamless R          
            and C++ Integration. \emph{Journal of Statistical Software},                  
            \bold{40(8)}, 1-18. URL \url{http://www.jstatsoft.org/v40/i08/}.

            Dominik Charousset, Thomas C. Schmidt, Raphael Hiesgen, CAF - 
            The C++ Actor Framework for Scalable and Resource-efficient 
            Applications, In: Proc. of the 5th ACM SIGPLAN Conf. on Systems 
            Programming and Applications (SPLASH '14) Workshop AGERE!, 
            New York, NY, USA:ACM, Oct. 2014.
}
\author{Grant Brown <grant-brown@uiowa.edu>}
\examples{
    loc.mat <- matrix(rnorm(1000*500), ncol = 500)
    system.time(r1<-CAFdist(loc.mat, cores = 2))
    system.time(r2<-dist(loc.mat))
}

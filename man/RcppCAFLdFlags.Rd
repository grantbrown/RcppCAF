\name{LdFlags}
\alias{LdFlags}
\alias{RcppCAFLdFlags}
\title{RcppCAF Linker Flags}
\description{
  RcppCAF aims to provide a copy of the CAF library to R package developers,
  and CAF is not a header only library. The preferred method of providing native
  routines to other packages is by 
  \href{explicit function registration}{https://cran.r-project.org/doc/manuals/r-release/R-exts.html#Linking-to-native-routines-in-other-packages}.
  Unfortunately, we have not (yet) found a good way of exporting the CAF API using 
  these methods. Instead, RcppCAF provides static libraries which may be linked 
  by other packages, and this function is called to aid in Makefile preparation. 
}
\usage{
LdFlags()
}
\value{
    A system path to libcaf_main.a 
}
\references{
  Dirk Eddelbuettel and Romain Francois (2011). \pkg{Rcpp}: Seamless R
  and C++ Integration. \emph{Journal of Statistical Software},
  \bold{40(8)}, 1-18. URL http://www.jstatsoft.org/v40/i08/ and
  available as \code{vignette("Rcpp-introduction")}.
}
\author{Grant Brown<grant-brown@uiowa.edu>}
\keyword{programming}
\keyword{interface}

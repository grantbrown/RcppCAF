\name{CAFdist}
\alias{CAFdist}
\title{Parallel Distance Matrix Computation}
\description{
  This function computes and returns the distance matrix computed by
  using the specified distance measure to compute the distances between
  the rows of a data matrix, mimicking the structure and return value
  of the built in \link{dist} function.
}
\usage{
CAFdist(x, method = "euclidean", diag = FALSE, upper = FALSE, p = 2, cores = 1)
}
\arguments{
  \item{x}{a numeric matrix, data frame or \code{"dist"} object.}
  \item{method}{the distance measure to be used. This must be one of
    \code{"euclidean"}, \code{"maximum"}, \code{"manhattan"},
    \code{"canberra"}, \code{"binary"} or \code{"minkowski"}.
    Any unambiguous substring can be given.}
  \item{diag}{logical value indicating whether the diagonal of the
    distance matrix should be printed by \code{print.dist}.}
  \item{upper}{logical value indicating whether the upper triangle of the
    distance matrix should be printed by \code{print.dist}.}
  \item{p}{The power of the Minkowski distance.}
  \item{cores}{The number of CAF workers among which computation should be 
     distributed.}

}
\details{
  See \code{\link{dist}} for additional details.
}
\value{
  \code{CAFdist} returns an object of class \code{"dist"}.

  The lower triangle of the distance matrix stored by columns in a
  vector, say \code{do}. If \code{n} is the number of
  observations, i.e., \code{n <- attr(do, "Size")}, then
  for \eqn{i < j \le n}, the dissimilarity between (row) i and j is
  \code{do[n*(i-1) - i*(i-1)/2 + j-i]}.
  The length of the vector is \eqn{n*(n-1)/2}, i.e., of order \eqn{n^2}.

   See \code{\link{dist}} for additional details.
}
\references{
  Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988)
  \emph{The New S Language}.
  Wadsworth & Brooks/Cole.

  Mardia, K. V., Kent, J. T. and Bibby, J. M. (1979)
  \emph{Multivariate Analysis.} Academic Press.

  Borg, I. and Groenen, P. (1997)
  \emph{Modern Multidimensional Scaling.  Theory and Applications.}
  Springer.
}
\seealso{
  \code{\link{dist}}.
}
\examples{
x <- matrix(rnorm(100), nrow = 5)
CAFdist(x, cores = 2)
}

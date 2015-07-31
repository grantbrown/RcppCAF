CAFdist <- function (x, method = "euclidean", diag = FALSE, upper = FALSE, 
          p = 2, cores = 1) 
{
  if (!is.na(pmatch(method, "euclidian"))) 
    method <- "euclidean"
  METHODS <- c("euclidean", "maximum", "manhattan", "canberra", 
               "binary", "minkowski")
  method <- pmatch(method, METHODS)
  if (is.na(method)) 
    stop("invalid distance method")
  if (method == -1) 
    stop("ambiguous distance method")
  # dummy code - check that we're restricted to euclidean case
  if (method != 1)
    stop("Only euclidean distance allowed currently.")
  x <- as.matrix(x)
  N <- nrow(x)
  attrs <- if (method == 6L) 
    list(Size = N, Labels = dimnames(x)[[1L]], Diag = diag, 
         Upper = upper, method = METHODS[method], p = p, call = match.call(), 
         class = "dist")
  else list(Size = N, Labels = dimnames(x)[[1L]], Diag = diag, 
            Upper = upper, method = METHODS[method], call = match.call(), 
            class = "dist")
  output = rcpp_caf_dist(x, cores)
  attributes(output) <- attrs
  output
}

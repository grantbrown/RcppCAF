LdFlags <- function()
{
    pkgLib = gsub("/libcaf_main.a", "", 
                  system.file("libcaf_main.a", package = "RcppCAF"))
    cat(pkgLib)
}

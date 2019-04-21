#' Deep Operators
#' @export
deepoperators <- new.env()

.onLoad <- function(libname, pkgname) {
  deepoperators.env <<- new.env()
  or_model <- keras::unserialize_model(readRDS(system.file("models", "or.rds", package = "DeepOperators", mustWork = TRUE)))
  and_model <- keras::unserialize_model(readRDS(system.file("models", "and.rds", package = "DeepOperators", mustWork = TRUE)))
  deepoperators.env$models <- list(
    or = or_model,
    and = and_model
  )
}

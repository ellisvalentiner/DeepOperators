#' @importFrom magrittr %>%

#' @describeIn deepoperators
#' @export
`%|%` <- function(x, y) {
  X <- matrix(as.integer(c(x, y)), ncol = 2)
  pred <- deepoperators.env$models$or %>%
    keras::predict_classes(X) %>%
    as.logical()
  return(pred)
}

#' @describeIn deepoperators
#' @export
`%&%` <- function(x, y) {
  X <- matrix(as.integer(c(x, y)), ncol = 2)
  pred <- deepoperators.env$models$and %>%
    predict_classes(X) %>%
    as.logical()
  return(pred)
}

#' @describeIn deepoperators
#' @export
`%=%` <- function(x, y) {
  X <- matrix(as.integer(c(x, y)), ncol = 2)
  pred <- deepoperators.env$models$eq %>%
    predict_classes(X) %>%
    as.logical()
  return(pred)
}

#' @describeIn deepoperators
#' @export
`%!%` <- function(x, y) {
  X <- matrix(as.integer(c(x, y)), ncol = 2)
  pred <- deepoperators.env$models$not %>%
    predict_classes(X) %>%
    as.logical()
  return(pred)
}

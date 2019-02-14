#' @importFrom magrittr %>%

#' @describeIn deepoperators
#' @export
deep_or <- function(x, y) {
  X <- matrix(as.integer(c(x, y)), ncol = 2)
  pred <- deepoperators.env$models$or %>%
    predict_classes(X) %>%
    as.logical()
  return(pred)
}

#' @describeIn deepoperators
#' @export
deep_and <- function(x, y) {
  X <- matrix(as.integer(c(x, y)), ncol = 2)
  pred <- deepoperators.env$models$and %>%
    predict_classes(X) %>%
    as.logical()
  return(pred)
}

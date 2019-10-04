#' @import keras

#' @export
train_deep_or <- function(steps_per_epoch = 100, epochs = 100, validation_steps = 100) {
  data_generator <- function() {
    x <- stats::rbinom(2, 1, 0.5)
    y <- as.integer(any(x))
    return(list(matrix(x, ncol=2), y))
  }
  input_tensor <- layer_input(shape = list(2))
  output_tensor <- input_tensor %>%
    layer_dense(units = 1) %>%
    layer_dense(units = 1) %>%
    layer_dense(units = 1, activation = "sigmoid")
  model <- keras_model(inputs = input_tensor, output_tensor)
  model %>% compile(
    loss = "binary_crossentropy",
    optimizer = "rmsprop",
    metrics = c("acc")
  )
  history <- model %>%
    fit_generator(
      data_generator,
      steps_per_epoch = 100,
      epochs = 100,
      validation_data = data_generator,
      validation_steps = 100
    )
  deepoperators.env$models$or <- model
}

#' @export
train_deep_and <- function(steps_per_epoch = 100, epochs = 100, validation_steps = 100) {
  data_generator <- function() {
    x <- stats::rbinom(2, 1, 0.5)
    y <- as.integer(all(x))
    return(list(matrix(x, ncol=2), y))
  }
  input_tensor <- layer_input(shape = list(2))
  output_tensor <- input_tensor %>%
    layer_dense(units = 1) %>%
    layer_dense(units = 1) %>%
    layer_dense(units = 1, activation = "sigmoid")
  model <- keras_model(inputs = input_tensor, output_tensor)
  model %>% compile(
    loss = "binary_crossentropy",
    optimizer = "rmsprop",
    metrics = c("acc")
  )
  history <- model %>%
    fit_generator(
      data_generator,
      steps_per_epoch = 100,
      epochs = 100,
      validation_data = data_generator,
      validation_steps = 100
    )
  deepoperators.env$models$and <- model
}

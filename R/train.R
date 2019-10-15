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


#' @export
train_deep_equlas <- function(epochs = 50, batch_size = 128) {

  # creating test/train data-set
  x_train <- matrix(round(runif(400, min = 0, max = 1)), nrow = 400, ncol = 1)
  x_train <- cbind(x_train,round(runif(400, min = 0, max = 1)) )
  y_train <- matrix(as.numeric(x_train[,1]==x_train[,2]))

  x_test <- matrix(round(runif(80, min = 0, max = 1)), nrow = 80, ncol = 1)
  x_test <- cbind(x_test,round(runif(80, min = 0, max = 1)) )
  y_test <- matrix(as.numeric(x_test[,1]==x_test[,2]))

  # create model
  model <- keras_model_sequential()

  # define and compile the model
  model %>%
    layer_dense(units = 64, activation = 'relu', input_shape = c(2)) %>%
    layer_dropout(rate = 0.5) %>%
    layer_dense(units = 64, activation = 'relu') %>%
    layer_dropout(rate = 0.5) %>%
    layer_dense(units = 1, activation = 'sigmoid') %>%
    compile(
      loss = 'binary_crossentropy',
      optimizer = 'rmsprop',
      metrics = c('accuracy')
    )

  # train
  model %>% fit(x_train, y_train, epochs = epochs, batch_size = batch_size)

  # evaluate
  score = model %>% evaluate(x_test, y_test, batch_size=batch_size)
  message("Loss: ", score$loss,"\nAcc: ", score$acc)
  deepoperators.env$models$eq<- model

}


#' @export
train_deep_not<- function(epochs = 50, batch_size = 128) {
  # creating test/train data-set
  x_train <- matrix(round(runif(400, min = 0, max = 1)), nrow = 400, ncol = 1)
  x_train <- cbind(x_train,round(runif(400, min = 0, max = 1)) )

  y_train <- matrix(as.numeric(x_train[,1]!=x_train[,2]))

  x_test <- matrix(round(runif(80, min = 0, max = 1)), nrow = 80, ncol = 1)
  x_test <- cbind(x_test,round(runif(80, min = 0, max = 1)) )
  y_test <- matrix(as.numeric(x_test[,1]!=x_test[,2]))

  # create model
  model <- keras_model_sequential()

  # define and compile the model
  model %>%
    layer_dense(units = 64, activation = 'relu', input_shape = c(2)) %>%
    layer_dropout(rate = 0.5) %>%
    layer_dense(units = 64, activation = 'relu') %>%
    layer_dropout(rate = 0.5) %>%
    layer_dense(units = 1, activation = 'sigmoid') %>%
    compile(
      loss = 'binary_crossentropy',
      optimizer = 'rmsprop',
      metrics = c('accuracy')
    )

  # train
  model %>% fit(x_train, y_train, epochs = epochs, batch_size = batch_size)

  # evaluate
  score = model %>% evaluate(x_test, y_test, batch_size=batch_size)
  message("Loss: ", score$loss,"\nAcc: ", score$acc)
  deepoperators.env$models$not<- model

}


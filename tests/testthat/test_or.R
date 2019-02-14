context("OR operator")
library(DeepOperators)

test_that("TRUE and TRUE is TRUE", {
  expect_true(deep_or(TRUE, TRUE))
})

test_that("TRUE and FALSE is TRUE", {
  expect_true(deep_or(TRUE, FALSE))
  expect_true(deep_or(FALSE, TRUE))
})

test_that("FALSE and FALSE is FALSE", {
  expect_false(deep_or(FALSE, FALSE))
})

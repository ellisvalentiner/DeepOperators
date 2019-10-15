context("Not equal operator")
library(DeepOperators)

test_that("TRUE and TRUE is FALSE", {
  expect_false(TRUE %!% TRUE)
})

test_that("FALSE and TRUE is TRUE", {
  expect_true(TRUE %!% FALSE)
  expect_true(FALSE %!% TRUE)
})

test_that("FALSE and FALSE is FALSE", {
  expect_false(FALSE %!% FALSE)
})
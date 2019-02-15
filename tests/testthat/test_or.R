context("OR operator")
library(DeepOperators)

test_that("TRUE or TRUE is TRUE", {
  expect_true(TRUE %|% TRUE)
})

test_that("TRUE or FALSE is TRUE", {
  expect_true(TRUE %|% FALSE)
  expect_true(FALSE %|% TRUE)
})

test_that("FALSE or FALSE is FALSE", {
  expect_false(FALSE %|% FALSE)
})

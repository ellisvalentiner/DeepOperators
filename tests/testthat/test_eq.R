context("Equivalence operator")
library(DeepOperators)

test_that("TRUE and TRUE is TRUE", {
  expect_true(TRUE %=% TRUE)
})

test_that("FALSE and TRUE is FALSE", {
  expect_false(TRUE %=% FALSE)
  expect_false(FALSE %=% TRUE)
})

test_that("FALSE and FALSE is TRUE", {
  expect_true(FALSE %=% FALSE)
})
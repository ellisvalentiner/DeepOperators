context("AND operator")
library(DeepOperators)

test_that("TRUE and TRUE is TRUE", {
  expect_true(deep_and(TRUE, TRUE))
})

test_that("TRUE and FALSE is FALSE", {
  expect_false(deep_and(TRUE, FALSE))
  expect_false(deep_and(FALSE, TRUE))
})

test_that("FALSE and FALSE is FALSE", {
  expect_false(deep_and(FALSE, FALSE))
})


<!-- README.md is generated from README.Rmd. Please edit that file -->

# DeepOperators

[![Travis build
status](https://travis-ci.org/ellisvalentiner/DeepOperators.svg?branch=master)](https://travis-ci.org/ellisvalentiner/DeepOperators)
[![Coverage
status](https://codecov.io/gh/ellisvalentiner/DeepOperators/branch/master/graph/badge.svg)](https://codecov.io/github/ellisvalentiner/DeepOperators?branch=master)

The goal of DeepOperators is to provide pre-trained deeply learned
boolean operators.

The `%&%` and `%|%` operators turn plain old business logic into “deep
learning”, “machine learning”, and “AI” problems. Because business folk
sometimes dictate how problems are solved, DeepOperators enables the
~~programmer~~ Data Scientist to use “deep learning” when it is required
but it would otherwise be more practical to use built-in logical
operators.

## Installation

You can install the development version of DeepOperators from GitHub
with:

``` r
# install.packages("remotes")
remotes::install_github("ellisvalentiner/DeepOperators")
```

## Example

This is a basic example of the DeepOperator functions:

``` r
library(DeepOperators)

# using the deep AND operator, %&%
TRUE %&% FALSE
#> [1] FALSE
TRUE %&% TRUE
#> [1] TRUE

# using the deep OR operator, %|%
TRUE %|% FALSE
#> [1] TRUE
FALSE %|% FALSE
#> [1] FALSE
```

Additionally DeepOperator provides function to automatically re-train
the deep operators.

``` r
train_deep_or()
train_deep_and()
```

## Provenance

This package was inspired by [Fizz Buzz in
Tensorflow](http://joelgrus.com/2016/05/23/fizz-buzz-in-tensorflow/).

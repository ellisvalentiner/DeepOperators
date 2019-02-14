
<!-- README.md is generated from README.Rmd. Please edit that file -->

# DeepOperators

The goal of DeepOperators is to provide pre-trained deeply learned
boolean operators.

The `deep_and` and `deep_or` operators turn plain old business logic
into “deep learning”, “machine learning”, and “AI” problems. Because
business folk sometimes dictate how problems are solved, DeepOperators
enables the ~~programmer~~ Data Scientist to use “deep learning” when it
is required but it would otherwise be more practical to use built-in
logical operators.

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
deep_and(TRUE, FALSE)
#> [1] FALSE
deep_and(TRUE, TRUE)
#> [1] TRUE
deep_or(TRUE, FALSE)
#> [1] TRUE
deep_or(FALSE, FALSE)
#> [1] FALSE
```

Additionally DeepOperator provides function to automatically re-train
the `deep_and` and `deep_or` operators.

``` r
train_deep_or()
train_deep_and()
```

## Provenance

This package was inspired by [Fizz Buzz in
Tensorflow](http://joelgrus.com/2016/05/23/fizz-buzz-in-tensorflow/).

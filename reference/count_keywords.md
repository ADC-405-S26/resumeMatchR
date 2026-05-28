# Count Keywords in Text

Counts how many times selected keywords appear in a piece of text. This
is useful for checking whether a resume includes important skills from a
job description.

## Usage

``` r
count_keywords(text, keywords, ignore_case = TRUE)
```

## Arguments

- text:

  A character string containing the resume or job description text.

- keywords:

  A character vector of keywords to search for.

- ignore_case:

  Logical. If TRUE, matching ignores capitalization.

## Value

A data frame with each keyword and its count.

## Examples

``` r
 resume <- "I have experience with R, Python, Excel, and data analysis."
count_keywords(resume, c("R", "Python", "SQL"))
#>   keyword count
#> 1       R     1
#> 2  Python     1
#> 3     SQL     0
```

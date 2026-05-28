# Calculate Simple Text Similarity

Calculates a simple overlap score between two pieces of text. The score
shows what proportion of important words in the job description also
appear in the resume.

## Usage

``` r
text_similarity_simple(resume_text, job_text, ignore_case = TRUE)
```

## Arguments

- resume_text:

  A character string containing the resume text.

- job_text:

  A character string containing the job description text.

- ignore_case:

  Logical. If TRUE, matching ignores capitalization.

## Value

A numeric value between 0 and 1. A higher value means more word overlap.

## Examples

``` r
resume <- "I have experience with R, Python, and data analysis."
job <- "Looking for skills in Python, SQL, and data analysis."
text_similarity_simple(resume, job)
#> [1] 0.4444444
```

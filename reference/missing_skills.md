# Find Missing Skills from a Resume

Compares a resume text to a list of required job skills and returns the
skills that are missing from the resume. This is useful for checking
whether a resume includes important keywords from a job description.

## Usage

``` r
missing_skills(resume_text, required_skills, ignore_case = TRUE)
```

## Arguments

- resume_text:

  A character string containing the resume text.

- required_skills:

  A character vector of required skills or keywords.

- ignore_case:

  Logical. If TRUE, matching ignores capitalization.

## Value

A character vector of required skills that were not found in the resume.

## Examples

``` r
resume <- "I have experience with R, Excel, and data visualization."
skills <- c("R", "Python", "SQL", "Excel")
missing_skills(resume, skills)
#> [1] "Python" "SQL"   
```

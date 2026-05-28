# Introduction to resumeMatchR

``` r

library(resumeMatchR)
```

## Introduction

`resumeMatchR` is a simple R package designed to help users compare
resumes and job descriptions using basic text analysis tools.

The package includes functions for:

- counting keywords in text
- finding missing skills in a resume
- calculating a simple similarity score between a resume and a job
  description

This vignette demonstrates how to use the main functions included in the
package.

## Example Dataset

The package includes a sample dataset called `resume_sample_data`.

Load the dataset:

``` r

data(resume_sample_data)

knitr::kable(
  resume_sample_data,
  caption = "Sample Resume and Job Description Dataset"
)
```

| candidate_name | target_role | resume_text | job_description |
|:---|:---|:---|:---|
| Alice Johnson | Data Analyst | Experienced in R, Python, Excel, SQL, and data visualization. | Looking for skills in Python, SQL, Tableau, and data visualization. |
| Brian Lee | Marketing Intern | Skilled in social media marketing, Canva, communication, and content creation. | Seeking experience with Canva, TikTok marketing, communication, and analytics. |
| Sophia Patel | Software Engineer | Experience with Java, Python, Git, problem solving, and teamwork. | Must know Java, Git, SQL, teamwork, and debugging. |

Sample Resume and Job Description Dataset {.table}

The dataset contains: - candidate names - target roles - resume text -
job descriptions

## Counting Keywords

The
[`count_keywords()`](https://adc-405-s26.github.io/resumeMatchR/reference/count_keywords.md)
function counts how many times selected keywords appear in a piece of
text.

``` r

count_keywords(
  resume_sample_data$resume_text[1],
  c("Python", "SQL", "Tableau")
)
#>   keyword count
#> 1  Python     1
#> 2     SQL     1
#> 3 Tableau     0
```

This is useful for checking whether important skills appear in a resume.

## Finding Missing Skills

The
[`missing_skills()`](https://adc-405-s26.github.io/resumeMatchR/reference/missing_skills.md)
function identifies required skills that are missing from the resume.

``` r

missing_skills(
  resume_sample_data$resume_text[1],
  c("Python", "SQL", "Tableau")
)
#> [1] "Tableau"
```

This can help users improve their resumes by identifying missing
keywords or skills.

## Calculating Text Similarity

The
[`text_similarity_simple()`](https://adc-405-s26.github.io/resumeMatchR/reference/text_similarity_simple.md)
function calculates a simple overlap score between a resume and a job
description.

``` r

text_similarity_simple(
  resume_sample_data$resume_text[1],
  resume_sample_data$job_description[1]
)
#> [1] 0.6
```

The similarity score ranges from 0 to 1: - values closer to 1 indicate
higher similarity - values closer to 0 indicate lower similarity

## Conclusion

## Conclusion

`resumeMatchR` provides simple tools for resume and job description
analysis. The package demonstrates basic text processing, defensive
programming, testing, and package development using the `devtools`
ecosystem.

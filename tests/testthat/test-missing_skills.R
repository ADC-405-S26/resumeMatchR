test_that("missing_skills returns skills not found in resume", {
  resume <- "I have experience with R, Excel, and data visualization."
  skills <- c("R", "Python", "SQL", "Excel")

  result <- missing_skills(resume, skills)

  expect_equal(result, c("Python", "SQL"))
})

test_that("missing_skills ignores case when ignore_case is TRUE", {
  resume <- "I have experience with python and excel."
  skills <- c("Python", "Excel")

  result <- missing_skills(resume, skills)

  expect_equal(result, character(0))
})

test_that("missing_skills respects case when ignore_case is FALSE", {
  resume <- "I have experience with python and excel."
  skills <- c("Python", "Excel")

  result <- missing_skills(resume, skills, ignore_case = FALSE)

  expect_equal(result, c("Python", "Excel"))
})

test_that("missing_skills returns character vector", {
  resume <- "I know R."
  skills <- c("R", "SQL")

  result <- missing_skills(resume, skills)

  expect_type(result, "character")
})
test_that("missing_skills does not return duplicate missing skills", {
  resume <- "I know R and Excel."
  skills <- c("Python", "Python", "SQL", "SQL", "Excel")

  result <- missing_skills(resume, skills)

  expect_equal(result, c("Python", "SQL"))
})

test_that("missing_skills gives error for invalid inputs", {
  expect_error(missing_skills(123, c("R", "Python")))
  expect_error(missing_skills("resume text", character(0)))
  expect_error(missing_skills("resume text", c("R"), ignore_case = "yes"))
})

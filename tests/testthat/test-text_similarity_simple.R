test_that("text_similarity_simple calculates correct overlap score", {
  resume <- "R Python Excel"
  job <- "Python SQL Excel"

  result <- text_similarity_simple(resume, job)

  expect_equal(result, 2 / 3)
})

test_that("text_similarity_simple returns 1 when all job words appear in resume", {
  resume <- "I know R Python SQL and Excel"
  job <- "Python SQL"

  result <- text_similarity_simple(resume, job)

  expect_equal(result, 1)
})

test_that("text_similarity_simple returns 0 when there is no overlap", {
  resume <- "R Python Excel"
  job <- "Tableau PowerBI SQL"

  result <- text_similarity_simple(resume, job)

  expect_equal(result, 0)
})

test_that("text_similarity_simple ignores case when ignore_case is TRUE", {
  resume <- "python excel"
  job <- "Python Excel"

  result <- text_similarity_simple(resume, job)

  expect_equal(result, 1)
})

test_that("text_similarity_simple respects case when ignore_case is FALSE", {
  resume <- "python excel"
  job <- "Python Excel"

  result <- text_similarity_simple(resume, job, ignore_case = FALSE)

  expect_equal(result, 0)
})

test_that("text_similarity_simple gives error for invalid inputs", {
  expect_error(text_similarity_simple(123, "Python SQL"))
  expect_error(text_similarity_simple("Resume text", 456))
  expect_error(text_similarity_simple("Resume text", "Job text", ignore_case = "yes"))
})

test_that("text_similarity_simple gives error when job text has no words", {
  expect_error(text_similarity_simple("I know R", "123 !!!"))
})

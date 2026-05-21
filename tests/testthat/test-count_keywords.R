test_that("count_keywords counts exact keyword matches", {
  text <- "I know R, Python, and Excel. Python is my strongest skill."
  result <- count_keywords(text, c("R", "Python", "SQL"))

  expect_equal(result$count, c(1, 2, 0))
})

test_that("count_keywords ignores case when ignore_case is TRUE", {
  text <- "python Python PYTHON"
  result <- count_keywords(text, c("python"))

  expect_equal(result$count, 3)
})

test_that("count_keywords respects case when ignore_case is FALSE", {
  text <- "python Python PYTHON"
  result <- count_keywords(text, c("Python"), ignore_case = FALSE)

  expect_equal(result$count, 1)
})

test_that("count_keywords returns a data frame", {
  text <- "R and SQL are useful."
  result <- count_keywords(text, c("R", "SQL"))

  expect_s3_class(result, "data.frame")
  expect_equal(names(result), c("keyword", "count"))
})

test_that("count_keywords gives error for invalid input", {
  expect_error(count_keywords(123, c("R", "Python")))
  expect_error(count_keywords("text", character(0)))
  expect_error(count_keywords("text", c("R"), ignore_case = "yes"))
})

#' Count Keywords in Text
#'
#' Counts how many times selected keywords appear in a piece of text.
#' This is useful for checking whether a resume includes important skills
#' from a job description.

#' @param text A character string containing the resume or job description text.
#' @param keywords A character vector of keywords to search for.
#' @param ignore_case Logical. If TRUE, matching ignores capitalization.
#'
#' @returns A data frame with each keyword and its count.
#' @export
#'
#' @examples
#'  resume <- "I have experience with R, Python, Excel, and data analysis."
#' count_keywords(resume, c("R", "Python", "SQL"))
#' @importFrom stringr str_count
#' @importFrom checkmate assert_string
#' @importFrom checkmate assert_character
#' @importFrom checkmate assert_logical
count_keywords <- function(text, keywords, ignore_case = TRUE) {
  checkmate::assert_string(text, min.chars = 1)
  checkmate::assert_character(keywords, min.len = 1, any.missing = FALSE)
  checkmate::assert_logical(ignore_case, len = 1, any.missing = FALSE)

  if (ignore_case) {
    text <- tolower(text)
    keywords_search <- tolower(keywords)
  } else {
    keywords_search <- keywords
  }

  counts <- vapply(
    keywords_search,
    function(keyword) {
      pattern <- paste0("\\b", keyword, "\\b")
      sum(stringr::str_count(text, pattern))
    },
    integer(1)
  )

  data.frame(
    keyword = keywords,
    count = as.integer(counts),
    stringsAsFactors = FALSE
  )
}

#' Calculate Simple Text Similarity
#'
#' Calculates a simple overlap score between two pieces of text.
#' The score shows what proportion of important words in the job description
#' also appear in the resume.
#'
#' @param resume_text A character string containing the resume text.
#' @param job_text A character string containing the job description text.
#' @param ignore_case Logical. If TRUE, matching ignores capitalization.
#'
#' @returns A numeric value between 0 and 1. A higher value means more word overlap.
#' @export
#'
#' @importFrom checkmate assert_string
#' @importFrom checkmate assert_logical
#' @importFrom stringr str_extract_all
#'
#' @examples
#' resume <- "I have experience with R, Python, and data analysis."
#' job <- "Looking for skills in Python, SQL, and data analysis."
#' text_similarity_simple(resume, job)

text_similarity_simple <- function(resume_text, job_text, ignore_case = TRUE) {

  checkmate::assert_string(resume_text)
  checkmate::assert_string(job_text)
  checkmate::assert_logical(ignore_case, len = 1, any.missing = FALSE)

  if (ignore_case) {
    resume_text <- tolower(resume_text)
    job_text <- tolower(job_text)
  }

  resume_words <- stringr::str_extract_all(resume_text, "\\b[a-zA-Z]+\\b")[[1]]
  job_words <- stringr::str_extract_all(job_text, "\\b[a-zA-Z]+\\b")[[1]]

  resume_words <- unique(resume_words)
  job_words <- unique(job_words)

  if (length(job_words) == 0) {
    stop("job_text must contain at least one word.", call. = FALSE)
  }

  overlap_words <- intersect(resume_words, job_words)

  length(overlap_words) / length(job_words)
}

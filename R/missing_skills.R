#' Find Missing Skills from a Resume
#'
#' Compares a resume text to a list of required job skills and returns the
#' skills that are missing from the resume. This is useful for checking whether
#' a resume includes important keywords from a job description.
#' @param resume_text A character string containing the resume text.
#' @param required_skills A character vector of required skills or keywords.
#' @param ignore_case Logical. If TRUE, matching ignores capitalization.
#'
#' @returns A character vector of required skills that were not found in the resume.
#' @export
#' @importFrom checkmate assert_string
#' @importFrom checkmate assert_character
#' @importFrom checkmate assert_logical
#' @importFrom stringr str_detect
#' @examples
#' resume <- "I have experience with R, Excel, and data visualization."
#' skills <- c("R", "Python", "SQL", "Excel")
#' missing_skills(resume, skills)
missing_skills <- function(resume_text, required_skills, ignore_case = TRUE) {

  checkmate::assert_string(resume_text, min.chars = 1)
  checkmate::assert_character(required_skills, min.len = 1, any.missing = FALSE)
  checkmate::assert_logical(ignore_case, len = 1, any.missing = FALSE)

  required_skills <- unique(required_skills)

  if (ignore_case) {
    resume_text_search <- tolower(resume_text)
    skills_search <- tolower(required_skills)
  } else {
    resume_text_search <- resume_text
    skills_search <- required_skills
  }

  found_skills <- vapply(
    skills_search,
    function(skill) {
      pattern <- paste0("\\b", skill, "\\b")
      stringr::str_detect(resume_text_search, pattern)
    },
    logical(1)
  )

  required_skills[!found_skills]
}

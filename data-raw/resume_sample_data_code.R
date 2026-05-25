## code to prepare `resume_sample_data_code` dataset goes here
resume_sample_data <- data.frame(
  candidate_name = c(
    "Alice Johnson",
    "Brian Lee",
    "Sophia Patel"
  ),

  target_role = c(
    "Data Analyst",
    "Marketing Intern",
    "Software Engineer"
  ),

  resume_text = c(
    "Experienced in R, Python, Excel, SQL, and data visualization.",

    "Skilled in social media marketing, Canva, communication, and content creation.",

    "Experience with Java, Python, Git, problem solving, and teamwork."
  ),

  job_description = c(
    "Looking for skills in Python, SQL, Tableau, and data visualization.",

    "Seeking experience with Canva, TikTok marketing, communication, and analytics.",

    "Must know Java, Git, SQL, teamwork, and debugging."
  ),

  stringsAsFactors = FALSE
)
usethis::use_data(resume_sample_data_code, overwrite = TRUE)

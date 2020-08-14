#' Create a New Project
#'
#' This function creates a new project with the correct folders and some files,
#' that are always used.
#'
#' @param path Filepath where project should be created
#' @param ... Optional arguments
#'
#' @return A file structure
bene_project <- function(path, ...) {
  # Create Project File
  dir.create(path = path, recursive = TRUE, showWarnings = FALSE)

  # Create Subfolders
  dir.create(path = file.path(path, "01 Raw Data"), recursive = TRUE, showWarnings = TRUE)
  dir.create(path = file.path(path, "02 Data"), recursive = TRUE, showWarnings = TRUE)
  dir.create(path = file.path(path, "03 R"), recursive = TRUE, showWarnings = TRUE)
  dir.create(path = file.path(path, "04 Figures"), recursive = TRUE, showWarnings = TRUE)
  dir.create(path = file.path(path, "05 Reports"), recursive = TRUE, showWarnings = TRUE)
  dir.create(path = file.path(path, "06 Literature"), recursive = TRUE, showWarnings = TRUE)
  dir.create(path = file.path(path, "99 Miscellaneous"), recursive = TRUE, showWarnings = TRUE)

  # Create Cleaning and Analyses Files
  file.create(file.path(path, "03 R", "data-cleaning.R"), showWarnings = FALSE)
  file.create(file.path(path, "03 R", "analyses.R"), showWarnings = FALSE)

  # Document Preambles
  cleaning_preamble <- paste(c("library(tidyverse)", "library(janitor)", "library(haven)"), collapse = "\n")
  analyses_preamble <- paste(c("library(tidyverse)", "library(benelib)"), collapse = "\n")

  writeLines(cleaning_preamble, con = file(file.path(path, "03 R", "data-cleaning.R")))
  writeLines(analyses_preamble, con = file(file.path(path, "03 R", "analyses.R")))
}

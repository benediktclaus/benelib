#' Create a New Project
#'
#' This function creates a new project with the correct folders and some files,
#' that are always used.
#'
#' @param path Filepath where project should be created
#' @param ... Optional arguments
#'
#' @importFrom fs dir_create file_copy
#' @importFrom purrr walk
#' @importFrom stringr str_glue
#'
#' @noRd
bene_project <- function(path, ...) {
  # Create project file
  dir_create(path = path)


  # Create subfolders
  folder_list <- list("01 Raw Data", "02 Data", "03 R", "04 Figures", "05 Reports", "06 Literature", "07 Paper", "99 Miscellaneous")
  folder_list %>%
    walk(~ dir_create(path = str_glue("{ path }/{ . }")))


  # Create Cleaning and Analyses Files
  file_copy(path = "data-raw/script-templates/data-cleaning.R", new_path = str_glue("{ path }/03 R/data-cleaning.R"))
  file_copy(path = "data-raw/script-templates/analyses.R", new_path = str_glue("{ path }/03 R/analyses.R"))
}

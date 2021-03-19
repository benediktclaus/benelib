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
  arguments <- list(...)
  package_path <- find.package("benelib")
  template_path <- str_glue("{ package_path }/script-templates/")

  # Create project file
  dir_create(path = path)


  # Create subfolders
  folder_list <- list("01 Raw Data", "02 Data", "03 R", "04 Figures", "05 Reports", "06 Literature")
  folder_list %>%
    walk(~ dir_create(path = str_glue("{ path }/{ . }")))


  # Include folder for article or miscellaneous files if checked
  if (arguments[["article"]]) {
    dir_create(str_glue("{ path }/07 Article"))
  }

  if (arguments[["misc"]]) {
    dir_create(str_glue("{ path }/99 Miscellaneous"))
  }


  # Create Cleaning and Analyses Files if checked
  if (arguments[["cleaning-csv"]]) {
    file_copy(path = str_glue("{ template_path }/data-cleaning-csv.R"), new_path = str_glue("{ path }/03 R/data-cleaning.R"))
  }

  if (arguments[["cleaning-spss"]]) {
    file_copy(path = str_glue("{ template_path }/data-cleaning-spss.R"), new_path = str_glue("{ path }/03 R/data-cleaning.R"))
  }

  if (arguments[["cleaning-excel"]]) {
    file_copy(path = str_glue("{ template_path }/data-cleaning-excel.R"), new_path = str_glue("{ path }/03 R/data-cleaning.R"))
  }

  if (arguments[["analyses"]]) {
    file_copy(path = str_glue("{ template_path }/analyses.R"), new_path = str_glue("{ path }/03 R/analyses.R"))
  }
}

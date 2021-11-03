#' Use Analysis Template
#'
#' Execute this function to use a default raw analysis template. By default, the
#' template will be placed into folder `03 R`, but the destination can be
#' changed via `destination_path`
#'
#' @param folder Folder to where the template should be copied.
#'   Defaults to "03 R". The folder must be in the current working directory.
#'
#' @importFrom fs path path_wd path_package file_copy
#'
#' @export
use_analysis_template <- function(folder = NA) {
  # Check correct folder name format
  if (!is.character(folder)) stop("The folder name must be a string.")
  template_path <- path(path_package("benelib"), "templates", "analyses.R")


  # If folder is defined, use it
  # If not, use default folder "03 R"
  if (!is.na(folder)) {
    destination_path <- path(path_wd(), folder)
  } else {
    destination_path <- path(path_wd(), "03 R")
  }


  file_copy(template_path, destination_path)
}


#' Use Data Cleaning Template
#'
#' Execute this function to use a data cleaning template containing the relevant
#' packages to clean a file of the chosen type.
#'
#' @inheritParams use_analysis_template
#' @param file_format Which file format do you want to clean? You can choose
#'   between "csv" (default), "excel", and "spss"
#'
#' @export
use_data_cleaning_template <- function(folder = NA, file_format = "csv") {
  # Check correct folder name format
  if (!is.character(folder)) stop("The folder name must be a string.")
  if (!is.character(file_format)) stop("The file format for which you want to create a data cleaning template must be a string.")
  if (!(file_format %in% c("csv", "excel", "spss"))) stop("Data cleaning templates are only available for \"csv\", \"excel\", and \"spss\".")

  template_path <- path(path_package("benelib"), "templates", str_c("data-cleaning-", file_format, ".R"))


  # If folder is defined, use it
  # If not, use default folder "03 R"
  if (!is.na(folder)) {
    destination_path <- path(path_wd(), folder)
  } else {
    destination_path <- path(path_wd(), "03 R")
  }


  file_copy(template_path, destination_path)
}

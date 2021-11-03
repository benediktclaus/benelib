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

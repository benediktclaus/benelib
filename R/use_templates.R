#' Use Analysis Template
#'
#' Execute this function to use a default raw analysis template. By default, the
#' template will be placed into folder `03 R`, but the destination can be
#' changed via `destination_path`
#'
#' @param destination_path Folder to where the template should be copied. Defaults to "03 R"
#'
#' @importFrom fs path path_wd path_package file_copy
#'
#' @export
use_analysis_template <- function(destination_path) {
  destination_path <- path(path_wd(), "03 R")
  template_path <- path(path_package("benelib"), "templates", "analysis.R")

  file_copy(template_path, destination_path)
}

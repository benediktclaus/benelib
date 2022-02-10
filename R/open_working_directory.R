#' Open Current Working Directory
#'
#' Shortcut to open the current working directory from the R console. This is
#' useful if one uses a file-launcher like one in Microsoft PowerToys and opens
#' the project file instead of the actual project folder.
#'
#' @importFrom fs file_show
#'
#' @export
open_working_directory <- function() {
  file_show(path_wd())
}

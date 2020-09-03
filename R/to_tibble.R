#' Convert Matrix Like Object to Tibble
#'
#' Convert "base R" function output  to a nicely printed tibble and get the
#' rownames into a dedicated column.
#'
#' @importFrom magrittr `%>%`
#'
#' @param data Matrix.
#' @param row_name String, specifiying the column label for rownames.
#'
#' @return A tibble.
#' @export
to_tibble <- function(data, row_name) {
  data %>%
    as.data.frame() %>%
    tibble::rownames_to_column(var = row_name) %>%
    tibble::as_tibble()
}

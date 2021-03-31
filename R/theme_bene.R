#' Custom Theme for ggplot2
#'
#' Custom `ggplot2` theme based on `theme_light()`.
#'
#' @import ggplot2
#'
#' @param base_size Integer, the text base size
#'
#' @return Theme for ggplot2.
#' @export
#'
#' @examples
#' library(ggplot2)
#'
#' \dontrun{
#' palmer_penguins %>%
#' ggplot(aes(bill_length_mm, bill_depth_mm, color = species)) +
#'   geom_point() +
#'   theme_bene()
#' }
theme_bene <- function(base_size = 11) {
  theme_light(
    base_size = base_size
  ) %+replace%
    theme(
      legend.position = "bottom"
    )
}

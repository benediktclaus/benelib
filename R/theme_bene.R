#' Custom Theme for ggplot2
#'
#' Custom `ggplot2` theme based on `theme_light()` but using Google's
#' Roboto as default font. To use the font, the package `extrafont` must be
#' loaded.
#'
#' @import ggplot2 extrafont
#'
#' @param base_size Integer, the text base size
#'
#' @return Theme for ggplot2.
#' @export
#'
#' @examples
#' library(ggplot2)
#'
#' ggplot(palmer_penguins, aes(bill_length_mm, bill_depth_mm, color = species)) +
#'   geom_point() +
#'   theme_bene()
theme_bene <- function(base_size = 11) {
  if (!"package:extrafont" %in% search()) {
    stop("To use theme_bene(), the extrafont package must be loaded. Try library(extrafont).")
  }

  theme_light(
    base_size = base_size
  ) %+replace%
    theme(
      text = element_text(family = "Roboto", color = "black"),
      legend.position = "bottom"
    )
}

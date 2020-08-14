#' Custom Theme for ggplot2
#'
#' Custom \code{ggplot2} theme based on \code{theme_light()} but using Google's
#' Roboto as default font. To use the font, the package \code{extrafont} must be
#' loaded.
#'
#' @import ggplot2
#'
#' @param base_size Integer, the text base size
#'
#' @return Theme for ggplot2.
#' @export
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' library(extrafont)
#'
#' ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
#'   geom_point() +
#'   theme_bene()
#' }
theme_bene <- function(base_size = 11) {
  if (!"package:extrafont" %in% search()) {
    stop("To use theme_bene(), the extrafont package must be loaded. Try library(extrafont).")
  }

  theme_light(
    base_size = base_size
  ) %+replace%
    theme(
      text = element_text(family = "Roboto")
    )
}

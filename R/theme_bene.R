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
      legend.position = "bottom",
      strip.background = element_rect(fill = "white", color = "white"),
      strip.text.x = element_text(color = "grey20", hjust = 0, margin = margin(b = 3, l = 0)),
      strip.text.y = element_text(color = "grey20", hjust = 0, angle = 270, margin = margin(l = 3))
    )
}

#' Set Palli Theme
#'
#' Set the Palli color theme for ggplot2 plots. This is a more coherent
#' version of theming using the thematic package.
#'
#' @param accent String, the accent color to choose (defaults to `green`). There
#'   are several options available: `green`, `orange`, `yellow`, `blue`,
#'   `grey`
#' @inheritParams use_pedscience_theme
#'
#' @export
#' @examples
#' library(ggplot2)
#'
#' # Ordinary ggplot2 plot
#' test_plot <- palmer_penguins %>%
#'   ggplot(aes(bill_length_mm, flipper_length_mm)) +
#'   geom_smooth(method = "loess") +
#'   geom_point(aes(color = species))
#' test_plot
#'
#' # Setting the theme
#' set_palli_theme()
#'
#' test_plot
use_palli_theme <- function(accent = "green", palette = "main", font = "Roboto", font_scale = 1, reverse = FALSE) {
  palli_colors <- c(
    "green"   = "#94c11f",
    "orange"  = "#ed8a0d",
    "yellow"  = "#fbb900",
    "blue"    = "#009fe3",
    "grey"    = "#bebebe"
  )

  palli_palettes <- list(
    "main"     = palli_colors[c("green", "orange", "yellow")],
    "playful"  = palli_colors[c("green", "yellow", "blue")],
    "full"     = palli_colors[c("green", "orange", "yellow", "blue", "grey")],
    "decent"   = palli_colors[c("green", "blue", "grey")],
    "bright"   = palli_colors[c("green", "yellow", "orange", "blue")]
  )


  chosen_palette <- purrr::pluck(palli_palettes, palette)

  if (reverse) chosen_palette <- rev(chosen_palette)

  thematic_on(
    bg = "white",
    fg = "black",
    accent = palli_colors[[accent]],
    sequential = sequential_gradient(fg_weight = 0, bg_weight = 0.9, fg_low = FALSE),
    qualitative = chosen_palette,
    font = font_spec(font, font_scale)
  )
}

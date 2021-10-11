#' Set DKSZ Theme
#'
#' Set the DKS color theme for ggplot2 plots. This is a more coherent
#' version of theming using the thematic package.
#'
#' @param accent String, the accent color to choose (defaults to `red`). There
#'   are several options available: `red`, `green`, `black`, `yellow`,
#'   `grey`
#' @inheritParams set_pedscience_theme
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
#' set_dksz_theme()
#'
#' test_plot
set_dksz_theme <- function(accent = "red", palette = "main", font = "Roboto", font_scale = 1, reverse = FALSE) {
  dksz_colors <- c(
    "red"        = "#d70014",
    "orange"     = "#eb6e00",
    "green"      = "#5fa916",
    "blue"       = "#0094e6",
    "purple"     = "#ff9900",
    "grey"       = "#787878"
  )

  dksz_palettes <- list(
    "main"      = dksz_colors[c("red", "orange", "green")],
    "playful"   = dksz_colors[c("orange", "green", "blue")],
    "full"      = dksz_colors[c("red", "orange", "green", "blue", "purple", "grey")],
    "decent"    = dksz_colors[c("red", "blue", "grey")],
    "bright"    = dksz_colors[c("red", "green", "blue")]
  )

  chosen_palette <- purrr::pluck(dksz_palettes, palette)

  if (reverse) chosen_palette <- rev(chosen_palette)

  thematic_on(
    bg = "white",
    fg = "black",
    accent = dksz_colors[[accent]],
    sequential = sequential_gradient(fg_weight = 0, bg_weight = 0.9, fg_low = FALSE),
    qualitative = chosen_palette,
    font = font_spec(font, font_scale)
  )
}

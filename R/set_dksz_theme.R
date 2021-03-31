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
set_dksz_theme <- function(accent = "red", palette = "main", reverse = FALSE) {
  dksz_colors <- c(
    "red"        = "#e52221",
    "green"      = "#00803d",
    "black"      = "#363c44",
    "yellow"     = "#ff9900",
    "grey"       = "#999594"
  )

  dksz_palettes <- list(
    "main"      = dksz_colors[c("red", "green", "black")],
    "playful"   = dksz_colors[c("red", "green", "yellow")],
    "full"      = dksz_colors[c("red", "green", "yellow", "black", "grey")],
    "decent"    = dksz_colors[c("green", "black", "grey")],
    "bright"    = dksz_colors[c("green", "yellow", "grey")]
  )

  chosen_palette <- purrr::pluck(dksz_palettes, palette)

  if (reverse) chosen_palette <- rev(chosen_palette)

  thematic_on(
    bg = "white",
    fg = "black",
    accent = dksz_colors[[accent]],
    sequential = sequential_gradient(fg_weight = 0, bg_weight = 0.9, fg_low = FALSE),
    qualitative = chosen_palette,
    font = "Roboto"
  )
}

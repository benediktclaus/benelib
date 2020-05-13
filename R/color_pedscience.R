# Vector with defined colors
pedscience_colors <- c(
  "blue"       = "#2356a3",
  "coral"      = "#e04313",
  "baby_blue"  = "#00b0d1",
  "dark_grey"  = "#4c4949",
  "light_grey" = "#9198a8"
)

#' Extract colors for PedScience by name
#'
#' @param ... Strings, the palettes, that should be used.
#'
#' @return Hex-values for colors based on string imput.
#' @noRd
pedscience_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols)) {
    return(pedscience_colors)
  } else {
    pedscience_colors[cols]
  }
}

# Palettes, based on defined colors
pedscience_palettes <- list(
  "main"     = pedscience_cols("blue", "coral", "light_grey"),
  "playful"  = pedscience_cols("blue", "coral", "baby_blue"),
  "heat"     = pedscience_cols("blue", "coral"),
  "full"     = pedscience_cols("blue", "coral", "dark_grey", "baby_blue"),
  "decent"   = pedscience_cols("blue", "dark_grey", "light_grey"),
  "bright"   = pedscience_cols("coral", "baby_blue", "light_grey")
)

#' Extract colors based on palette
#'
#' @inheritParams scale_color_pedscience
#'
#' @return Hex-values for the used palette.
#' @noRd
pedscience_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- purrr::pluck(pedscience_palettes, palette)

  if (reverse) pal <- rev(pal)

  grDevices::colorRampPalette(pal, ...)
}

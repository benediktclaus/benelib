# Vector with defined colors for personal color scheme
personal_colors <- c(
  "blue"       = "#004358",
  "dark_green" = "#1F8A70",
  "green"      = "#BEDB39",
  "yellow"     = "#FFE11A",
  "orange"     = "#FD7400",
  "grey"       = "#BBBED0"
)

#' Extract colors for personal color scheme by name
#'
#' @param ... Strings, the palettes, that should be used.
#'
#' @return Hex-values for colors based on string imput.
#' @noRd
personal_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols)) {
    return(personal_colors)
  } else {
    personal_colors[cols]
  }
}

# Palettes, based on defined colors
personal_palettes <- list(
  "main"     = personal_cols("blue", "dark_green", "green"),
  "playful"  = personal_cols("dark_green", "green", "yellow"),
  "heat"     = personal_cols("blue", "orange"),
  "full"     = personal_cols("blue", "dark_green", "green", "yellow", "orange"),
  "decent"   = personal_cols("blue", "dark_green", "grey"),
  "bright"   = personal_cols("green", "yellow", "orange")
)

#' Extract colors based on palette for personal color scheme
#'
#' @inheritParams scale_color_pedscience
#'
#' @return Hex-values for the used palette.
#' @noRd
personal_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- purrr::pluck(personal_palettes, palette)

  if (reverse) pal <- rev(pal)

  grDevices::colorRampPalette(pal, ...)
}

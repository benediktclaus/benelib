# Vector with defined colors
dksz_colors <- c(
  "red"        = "#e52221",
  "green"      = "#00803d",
  "black"      = "#000000",
  "yellow"     = "#fbc100",
  "grey"       = "#bebebe"
)


#' Extract colors for DKSZ by name
#'
#' @param ... Strings, the palettes, that should be used.
#'
#' @return Hex-values for colors based on string imput.
#' @noRd
dksz_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols)) {
    return(dksz_colors)
  } else {
    dksz_colors[cols]
  }
}

# Palettes, based on defined colors
dksz_palettes <- list(
  "main"     = dksz_cols("red", "green", "black"),
  "playful"  = dksz_cols("red", "green", "yellow"),
  "heat"     = dksz_cols("green", "red"),
  "full"     = dksz_cols("red", "green", "yellow", "black", "grey"),
  "decent"   = dksz_cols("green", "black", "grey"),
  "bright"   = dksz_cols("green", "yellow", "grey")
)


#' Extract colors based on palette
#'
#' @inheritParams scale_color_pedscience
#'
#' @return Hex-values for the used palette.
#' @noRd
dksz_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- purrr::pluck(dksz_palettes, palette)

  if (reverse) pal <- rev(pal)

  grDevices::colorRampPalette(pal, ...)
}

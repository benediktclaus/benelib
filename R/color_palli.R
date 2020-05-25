# Vector with defined colors for Palliativzentrum
palli_colors <- c(
  "green"   = "#94c11f",
  "orange"     = "#ed8a0d",
  "yellow"  = "#fbb900",
  "blue"    = "#009fe3",
  "grey"    = "#bebebe"
)


#' Extract colors from Palli by name
#'
#' @inheritParams pedscience_cols
#'
#' @return Hex-values for colors based on string imput.
#' @noRd
palli_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols)) {
    return(palli_colors)
  } else {
    palli_colors[cols]
  }
}

# Palettes, based on defined colors
palli_palettes <- list(
  "main"     = palli_cols("green", "orange", "yellow"),
  "playful"  = palli_cols("green", "yellow", "blue"),
  "heat"     = palli_cols("green", "orange"),
  "full"     = palli_cols("green", "orange", "yellow", "blue", "grey"),
  "decent"   = palli_cols("green", "blue", "grey"),
  "bright"   = palli_cols("green", "yellow", "orange", "blue")
)


#' Extract colors based on palette
#'
#' @inheritParams pedscience_pal
#'
#' @return Hex-values for the used palette.
#' @noRd
palli_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- purrr::pluck(palli_palettes, palette)

  if (reverse) pal <- rev(pal)

  grDevices::colorRampPalette(pal, ...)
}

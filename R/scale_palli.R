#' Palli Color and Fill Scale
#'
#' These color and fill functions are useful for generating the Palli color
#' scheme for `ggplot2` plots.
#'
#' @inheritParams scale_color_pedscience
#'
#' @name scale-palli
NULL

# Vector with defined colors for Palliativzentrum
palli_colors <- c(
  "green"   = "#94c11f",
  "orange"  = "#ed8a0d",
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
#' @return Hex-values for the used palette.
#' @noRd
palli_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- purrr::pluck(palli_palettes, palette)

  if (reverse) pal <- rev(pal)

  grDevices::colorRampPalette(pal, ...)
}


#' @rdname scale-palli
scale_color_palli <- function(palette = "main", discrete = TRUE, reverse = FALSE, na.value = "grey80", ...) {
  pal <- palli_pal(palette = palette, reverse = reverse)
  na_value <- na.value

  if (discrete) {
    ggplot2::discrete_scale("colour", paste0("palli_", palette), palette = pal, na.value = na_value, ...)
  } else {
    ggplot2::scale_color_gradientn(colours = pal(256), na.value = na_value, ...)
  }
}


#' @rdname scale-palli
scale_fill_palli <- function(palette = "main", discrete = TRUE, reverse = FALSE, na.value = "grey80", ...) {
  pal <- palli_pal(palette = palette, reverse = reverse)
  na_value <- na.value

  if (discrete) {
    ggplot2::discrete_scale("fill", scale_name = paste0("palli_", palette), palette = pal, na.value = "grey80", ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), na.value = "grey80", ...)
  }
}

#' DKSZ Color and Fill Scale
#'
#' These color and fill functions are useful for generating the DKSZ color
#' scheme for `ggplot2` plots.
#'
#' @inheritParams scale_color_pedscience
#'
#' @name scale-dksz
#' @md
NULL

# Vector with defined colors
dksz_colors <- c(
  "red"        = "#e52221",
  "green"      = "#00803d",
  "black"      = "#363c44",
  "yellow"     = "#ff9900",
  "grey"       = "#999594"
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
#' @return Hex-values for the used palette.
#' @noRd
dksz_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- purrr::pluck(dksz_palettes, palette)

  if (reverse) pal <- rev(pal)

  grDevices::colorRampPalette(pal, ...)
}


#' @rdname scale-dksz
scale_color_dksz <- function(palette = "main", discrete = TRUE, reverse = FALSE, na.value = "grey70", ...) {
  pal <- dksz_pal(palette = palette, reverse = reverse)
  na_value <- na.value

  if (discrete) {
    ggplot2::discrete_scale("colour", paste0("dksz_", palette), palette = pal, na.value = na_value, ...)
  } else {
    ggplot2::scale_color_gradientn(colours = pal(256), na.value = na_value, ...)
  }
}


#' @rdname scale-dksz
scale_fill_dksz <- function(palette = "main", discrete = TRUE, reverse = FALSE, na.value = "grey70", ...) {
  pal <- dksz_pal(palette = palette, reverse = reverse)
  na_value <- na.value

  if (discrete) {
    ggplot2::discrete_scale("fill", scale_name = paste0("dksz_", palette), palette = pal, na.value = na_value, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), na.value = na_value, ...)
  }
}

#' PedScience Color and Fill Scale
#'
#' These color and fill functions are useful for generating the PedScience color
#' scheme for `ggplot2` plots.
#'
#' @param palette String, the color palette to use (defaults to `main`). There
#'   are several options available: `main`, `playful`, `heat` (for heat meaps),
#'   `heat_mono` (for monochromatic heatmaps), `full`, `decent`, `bright`.
#' @param discrete Logical, defaults to `TRUE`. Set to `FALSE` when using a
#'   continuous scale.
#' @param reverse Logical, defaults to `FALSE`. Setting this to `TRUE` changes
#'   the order of the colors.
#' @param na.value String, the color for NA values.
#' @param ... Additional arguments passed to [ggplot2::discrete_scale()]
#'   for discrete scales and [ggplot2::scale_color_gradientn()] for continuous
#'   scales.
#'
#' @name scale-pedscience
#' @md
NULL

# Vector with defined colors
pedscience_colors <- c(
  "blue"       = "#2356a3",
  "coral"      = "#e04313",
  "baby_blue"  = "#00b0d1",
  "dark_grey"  = "#4c4949",
  "light_grey" = "#9198a8",
  "light_blue" = "#C0D3F0"
)

#' Extract PedScience colors by color name
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
  "main"      = pedscience_cols("blue", "light_grey", "coral"),
  "playful"   = pedscience_cols("blue", "coral", "baby_blue"),
  "heat"      = pedscience_cols("blue", "coral"),
  "heat_mono" = pedscience_cols("light_blue", "blue"),
  "full"      = pedscience_cols("blue", "coral", "dark_grey", "baby_blue"),
  "decent"    = pedscience_cols("blue", "dark_grey", "light_grey"),
  "bright"    = pedscience_cols("coral", "light_grey", "baby_blue")
)



#' Extract PedScience colors based on palette name
#'
#' @return Hex-values for the used palette.
#' @noRd
pedscience_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- purrr::pluck(pedscience_palettes, palette)

  if (reverse) pal <- rev(pal)

  grDevices::colorRampPalette(pal, ...)
}


#' @rdname scale-pedscience
scale_color_pedscience <- function(palette = "main", discrete = TRUE, reverse = FALSE, na.value = "grey80", ...) {
  pal <- pedscience_pal(palette = palette, reverse = reverse)
  na_value <- na.value

  if (discrete) {
    ggplot2::discrete_scale("colour", paste0("pedscience_", palette), palette = pal, na.value = na_value, ...)
  } else {
    ggplot2::scale_color_gradientn(colours = pal(256), na.value = na_value, ...)
  }
}


#' @rdname scale-pedscience
scale_fill_pedscience <- function(palette = "main", discrete = TRUE, reverse = FALSE, na.value = "grey80", ...) {
  pal <- pedscience_pal(palette = palette, reverse = reverse)
  na_value <- na.value

  if (discrete) {
    ggplot2::discrete_scale("fill", scale_name = paste0("pedscience_", palette), palette = pal, na.value = na_value, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), na.value = na_value, ...)
  }
}

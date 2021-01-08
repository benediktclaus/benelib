#' Palli Color and Fill Scale
#'
#' These color and fill functions are useful for generating the Palli color
#' scheme for `ggplot2` plots.
#'
#' With these functions one can create custom color and fill scales according to
#' the Palli color scheme. Implemented are also various variations of the
#' `maine` color palette. All scales can be used for discrete scales (default)
#' or continuous scales (with `discrete = FALSE`). All scales can be reversed,
#' if necessary, by setting the argumet `reverse = TRUE`.
#'
#' @inheritParams scale_color_pedscience
#'
#' @name scale-palli
#'
#' @examples
#' library(ggplot2)
#'
#' # Change default color scale
#' ggplot(palmer_penguins, aes(bill_length_mm, bill_depth_mm, color = species)) +
#'   geom_point() +
#'   scale_color_palli()
#'
#' # Change default fill scale
#' ggplot(palmer_penguins, aes(species, bill_length_mm, fill = species)) +
#'   geom_boxplot() +
#'   scale_fill_palli()
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
#' @export
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
#' @export
scale_fill_palli <- function(palette = "main", discrete = TRUE, reverse = FALSE, na.value = "grey80", ...) {
  pal <- palli_pal(palette = palette, reverse = reverse)
  na_value <- na.value

  if (discrete) {
    ggplot2::discrete_scale("fill", scale_name = paste0("palli_", palette), palette = pal, na.value = "grey80", ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), na.value = "grey80", ...)
  }
}

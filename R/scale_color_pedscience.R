#' Color scale using the PedScience color scheme
#'
#' Color scale using the PedScience color scheme in ggplot2.
#'
#' @param palette String, the color palette to use (defaults to \code{"main"}).
#'   There are several options available: \code{"main"}, \code{"playful"},
#'   \code{"heat"} (for heat maps), \code{"full"}, \code{"decent"}, and
#'   \code{"bright"}.
#' @param discrete Logical, defaults to \code{TRUE}. Set to \code{FALSE} when
#'   using a continuous scale.
#' @param reverse Logical, defaults to \code{FALSE}. Setting this to \code{TRUE}
#'   changes the order of the colors.
#' @param ... Additional arguments passed to \code{\link{scale_color_gradientn}}.
#'
#' @return The PedScience color scale for ggplot2.
#' @export
scale_color_pedscience <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- pedscience_pal(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("colour", paste0("pedscience_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Fill scale using the PedScience color scheme
#'
#' Fill scale using the PedScience color scheme in ggplot2.
#'
#' @inheritParams scale_color_pedscience
#'
#' @return The PedScience fill scale for ggplot2.
#' @export
scale_fill_pedscience <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- pedscience_pal(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("fill", scale_name = paste0("pedscience_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), ...)
  }
}


# Vektor mit definierten Farben
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

# Farb-Variationen und Themes
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

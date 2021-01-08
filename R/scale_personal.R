#' Personal Color and Fill Scale
#'
#' These color and fill functions are useful for generating my personal color
#' scheme for `ggplot2` plots.
#'
#' With these functions one can create custom color and fill scales according to
#' my personal color scheme. Implemented are also various variations of the
#' `maine` color palette. All scales can be used for discrete scales (default)
#' or continuous scales (with `discrete = FALSE`). All scales can be reversed,
#' if necessary, by setting the argumet `reverse = TRUE`.
#'
#' @inheritParams scale_color_pedscience
#'
#' @name scale-personal
#'
#' @examples
#' library(ggplot2)
#'
#' # Change default color scale
#' ggplot(palmer_penguins, aes(bill_length_mm, bill_depth_mm, color = species)) +
#'   geom_point() +
#'   scale_color_personal()
#'
#' # Change default fill scale
#' ggplot(palmer_penguins, aes(species, bill_length_mm, fill = species)) +
#'   geom_boxplot() +
#'   scale_fill_personal()
NULL

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
#' @return Hex-values for the used palette.
#' @noRd
personal_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- purrr::pluck(personal_palettes, palette)

  if (reverse) pal <- rev(pal)

  grDevices::colorRampPalette(pal, ...)
}


#' @rdname scale-personal
#' @export
scale_color_personal <- function(palette = "main", discrete = TRUE, reverse = FALSE, na.value = "grey80", ...) {
  pal <- personal_pal(palette = palette, reverse = reverse)
  na_value <- na.value

  if (discrete) {
    ggplot2::discrete_scale("colour", paste0("personal_", palette), palette = pal, na.value = na_value, ...)
  } else {
    ggplot2::scale_color_gradientn(colours = pal(256), na.value = na_value, ...)
  }
}


#' @rdname scale-personal
#' @export
scale_fill_personal <- function(palette = "main", discrete = TRUE, reverse = FALSE, na.value = "grey80", ...) {
  pal <- personal_pal(palette = palette, reverse = reverse)
  na_value <- na.value

  if (discrete) {
    ggplot2::discrete_scale("fill", scale_name = paste0("personal_", palette), palette = pal, na.value = na_value, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), na.value = na_value, ...)
  }
}

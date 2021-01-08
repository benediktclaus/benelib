#' Personal Color and Fill Scale
#'
#' These color and fill functions are useful for generating my personal color
#' scheme for `ggplot2` plots.
#'
#' @inheritParams scale_color_pedscience
#'
#' @name scale-personal
#' @md
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
scale_fill_personal <- function(palette = "main", discrete = TRUE, reverse = FALSE, na.value = "grey80", ...) {
  pal <- personal_pal(palette = palette, reverse = reverse)
  na_value <- na.value

  if (discrete) {
    ggplot2::discrete_scale("fill", scale_name = paste0("personal_", palette), palette = pal, na.value = na_value, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), na.value = na_value, ...)
  }
}

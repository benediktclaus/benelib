#' Set a Custom ggplot2 Theme
#'
#' @param palette A palette in `theming_palettes`. Can be one of
#'   - `"main"`
#'   - `"playful"`
#'   - `"full"`
#'   - `"decent"`
#'   - `"bright"`
#' @param theme Which theme to pick the palette from. Can be one of
#'   - `"personal"`
#'   - `"pedscience"`
#'   - `"palli"`
#'   - `"dksz"`
#' @param accent_color The accent color. Can be a string for a HEX value. The
#'   default is the palettes accent color in `theming_palettes`
#' @param font String, a Google Font. Default is `"Roboto"`
#' @param reverse Logical. Should the palette be reversed?
#'
#' @return Nothing, called for side effects
#' @export
#'
#' @examples
#' library(ggplot2)
#' use_custom_theme(palette = "full")
#'
#' example_plot <- mpg %>%
#'   ggplot(aes(displ, hwy, color = as.factor(cyl))) +
#'   geom_point()
#' example_plot
#'
#' use_personal_theme()
#' example_plot
#'
#' use_pedscience_theme()
#' example_plot
#'
#' use_palli_theme()
#' example_plot
#'
#' use_dksz_theme()
#' example_plot
#'
#' # Reset the theme with
#' use_base_theme()
#' example_plot
use_custom_theme <- function(palette = "main", theme = "personal", accent_color, font = "Roboto", reverse = FALSE) {
  theming_palettes <- theming_palettes
  initialize_device()
  ggplot2::theme_set(theme_bene())

  chosen_palette <- purrr::pluck(theming_palettes, theme, palette)

  if (missing(accent_color)) accent_color <- purrr::pluck(theming_palettes, theme, "accent") else accent_color <- accent_color
  if (reverse) chosen_palette <- rev(chosen_palette)

  thematic::thematic_on(
    bg = "white",
    fg = "grey10",
    accent = accent_color,
    sequential = thematic::sequential_gradient(fg_weight = 0, bg_weight = 0.9, fg_low = FALSE),
    qualitative = chosen_palette,
    font = thematic::font_spec(font)
  )
}

#' @rdname use_custom_theme
#' @export
use_personal_theme <- function(palette = "full", theme = "personal", accent_color, font = "Roboto", reverse = FALSE) {
  use_custom_theme(
    palette = palette,
    theme = theme,
    accent_color = accent_color,
    font = font,
    reverse = reverse
  )
}

#' @rdname use_custom_theme
#' @export
use_pedscience_theme <- function(palette = "full", theme = "pedscience", accent_color, font = "Roboto", reverse = FALSE) {
  use_custom_theme(
    palette = palette,
    theme = theme,
    accent_color = accent_color,
    font = font,
    reverse = reverse
  )
}

#' @rdname use_custom_theme
#' @export
use_palli_theme <- function(palette = "full", theme = "palli", accent_color, font = "Roboto", reverse = FALSE) {
  use_custom_theme(
    palette = palette,
    theme = theme,
    accent_color = accent_color,
    font = font,
    reverse = reverse
  )
}

#' @rdname use_custom_theme
#' @export
use_dksz_theme <- function(palette = "full", theme = "dksz", accent_color, font = "Roboto", reverse = FALSE) {
  use_custom_theme(
    palette = palette,
    theme = theme,
    accent_color = accent_color,
    font = font,
    reverse = reverse
  )
}


#' Initialize Graphics Device
#'
#' When use a custom themin function with thematic, the package showtext will
#' throw an error if no plot was rendered yet. This is because showtext checks,
#' if a graphics device is active. If not (default), the error is thrown. This
#' function checks whether a graphics devide is active and sets the next one if
#' that is not the case.
#'
#' @noRd
initialize_device <- function() {
  if (grDevices::dev.cur() == 1) grDevices::dev.set()
}


#' Remove Custom Color Theme
#'
#' Remove a previously set custom color theme and return to ggplot2 defaults.
#'
#' @importFrom thematic thematic_off
#'
#' @export
use_base_theme <- function() {
  ggplot2::theme_set(ggplot2::theme_gray())
  thematic_off()
}

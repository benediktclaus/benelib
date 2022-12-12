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
#' use_custom_theme(palette = "full")
#'
#' mpg %>%
#'   ggplot(aes(displ, hwy, color = as_factor(cyl))) +
#'   geom_point()
#'
#' # Reset the theme with
#' use_base_theme()
use_custom_theme <- function(palette = "main", theme = "personal", accent_color, font = "Roboto", reverse = FALSE) {
  theme_set(theme_bene())

  chosen_palette <- pluck(theming_palettes, theme, palette)

  if (missing(accent_color)) accent_color <- pluck(theming_palettes, theme, "accent") else accent_color <- accent_color
  if (reverse) chosen_palette <- rev(chosen_palette)

  thematic_on(
    bg = "white",
    fg = "grey20",
    accent = accent_color,
    sequential = sequential_gradient(fg_weight = 0, bg_weight = 0.9, fg_low = FALSE),
    qualitative = chosen_palette,
    font = font_spec(font)
  )
}

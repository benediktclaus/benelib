#' Set PedScience Theme
#'
#' Set the PedScience color theme for ggplot2 plots. This is a more coherent
#' version of theming using the thematic package.
#'
#' @importFrom purrr pluck
#' @importFrom thematic thematic_on sequential_gradient font_spec
#'
#' @param accent String, the accent color to choose (defaults to `blue`). There
#'   are several options available: `blue`, `coral`, `baby_blue`, `dark_grey`,
#'   `light_grey`, `light_blue`
#' @param palette String, the color palette to use (defaults to `main`). There
#'   are several options available: `main`, `playful`, `full`, `decent`, `bright`.
#' @param reverse Logical, defaults to `FALSE`. Setting this to `TRUE` changes
#'   the order of the colors.
#' @param font String, a font of choice (defaults to Roboto)
#' @param font_scale Integer, scaling factor for fonts (defaults to 1)
#'
#' @export
#' @examples
#' library(ggplot2)
#'
#' # Ordinary ggplot2 plot
#' test_plot <- palmer_penguins %>%
#'   ggplot(aes(bill_length_mm, flipper_length_mm)) +
#'   geom_smooth(method = "loess") +
#'   geom_point(aes(color = species))
#' test_plot
#'
#' # Setting the theme
#' use_pedscience_theme()
#'
#' test_plot
#'
#' # Remove theme
#' use_base_theme()
use_pedscience_theme <- function(accent = "blue", palette = "main", font = "Roboto", font_scale = 1, reverse = FALSE) {
  initialize_device()

  pedscience_colors <- c(
    "blue"       = "#2356a3",
    "coral"      = "#e04313",
    "baby_blue"  = "#00b0d1",
    "dark_grey"  = "#4c4949",
    "light_grey" = "#9198a8",
    "light_blue" = "#C0D3F0"
  )

  pedscience_palettes <- list(
    "main"      = pedscience_colors[c("blue", "coral", "light_grey")],
    "playful"   = pedscience_colors[c("blue", "coral", "baby_blue")],
    "full"      = pedscience_colors[c("blue", "coral", "dark_grey", "baby_blue")],
    "decent"    = pedscience_colors[c("blue", "dark_grey", "light_grey")],
    "bright"    = pedscience_colors[c("coral", "baby_blue", "light_grey")]
  )

  chosen_palette <- purrr::pluck(pedscience_palettes, palette)

  if (reverse) chosen_palette <- rev(chosen_palette)

thematic_on(
  bg = "white",
  fg = "black",
  accent = pedscience_colors[[accent]],
  sequential = sequential_gradient(fg_weight = 0, bg_weight = 0.9, fg_low = FALSE),
  qualitative = chosen_palette,
  font = font_spec(font, font_scale)
)
}


#' Remove Custom Color Theme
#'
#' Remove a previously set custom color theme and return to ggplot2 defaults.
#'
#' @importFrom thematic thematic_off
#'
#' @export
use_base_theme <- function() {
  thematic_off()
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

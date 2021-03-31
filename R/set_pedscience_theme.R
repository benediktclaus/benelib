#' Set PedScience Theme
#'
#' Set the PedScience color theme for ggplot2 plots. This is a more coherent
#' version of theming using the thematic package.
#'
#' @importFrom purrr pluck
#' @importFrom thematic thematic_on sequential_gradient
#'
#' @param accent String, the accent color to choose (defaults to `blue`). There
#'   are several options available: `blue`, `coral`, `baby_blue`, `dark_grey`,
#'   `light_grey`, `light_blue`
#' @param palette String, the color palette to use (defaults to `main`). There
#'   are several options available: `main`, `playful`, `full`, `decent`, `bright`.
#' @param reverse Logical, defaults to `FALSE`. Setting this to `TRUE` changes
#'   the order of the colors.
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
#' set_pedscience_theme()
#'
#' test_plot
set_pedscience_theme <- function(accent = "blue", palette = "main", reverse = FALSE) {
  pedscience_colors <- c(
    "blue"       = "#2356a3",
    "coral"      = "#e04313",
    "baby_blue"  = "#00b0d1",
    "dark_grey"  = "#4c4949",
    "light_grey" = "#9198a8",
    "light_blue" = "#C0D3F0"
  )

  pedscience_palettes <- list(
    "main"      = pedscience_colors[c("blue", "light_grey", "coral")],
    "playful"   = pedscience_colors[c("blue", "coral", "baby_blue")],
    "full"      = pedscience_colors[c("blue", "coral", "dark_grey", "baby_blue")],
    "decent"    = pedscience_colors[c("blue", "dark_grey", "light_grey")],
    "bright"    = pedscience_colors[c("coral", "light_grey", "baby_blue")]
  )

  chosen_palette <- purrr::pluck(pedscience_palettes, palette)

  if (reverse) chosen_palette <- rev(chosen_palette)

thematic_on(
  bg = "white",
  fg = "black",
  accent = pedscience_colors[[accent]],
  sequential = sequential_gradient(fg_weight = 0, bg_weight = 0.9, fg_low = FALSE),
  qualitative = chosen_palette,
  font = "Roboto"
)
}


#' Remove Custom Color Theme
#'
#' Remove a previously set custom color theme and return to ggplot2 defaults.
#'
#' @importFrom thematic thematic_off
#'
#' @export
remove_theme <- function() {
  thematic_off()
}

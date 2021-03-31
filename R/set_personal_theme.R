#' Set Personal Theme
#'
#' Set my personal color theme for ggplot2 plots. This is a more coherent
#' version of theming using the thematic package.
#'
#' @param accent String, the accent color to choose (defaults to `blue`). There
#'   are several options available: `dark_green`, `green`, `yellow`, `orange`,
#'   `grey`
#' @inheritParams set_pedscience_theme
#'
#' @export
#'
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
#' set_personal_theme()
#'
#' test_plot
set_personal_theme <- function(accent = "blue", palette = "main", reverse = FALSE) {
  personal_colors <- c(
    "blue"       = "#004358",
    "dark_green" = "#1F8A70",
    "green"      = "#BEDB39",
    "yellow"     = "#FFE11A",
    "orange"     = "#FD7400",
    "grey"       = "#BBBED0"
  )

  personal_palettes <- list(
    "main"     = personal_colors[c("blue", "dark_green", "green")],
    "playful"  = personal_colors[c("dark_green", "green", "yellow")],
    "full"     = personal_colors[c("blue", "dark_green", "green", "yellow", "orange")],
    "decent"   = personal_colors[c("blue", "dark_green", "grey")],
    "bright"   = personal_colors[c("green", "yellow", "orange")]
  )


  chosen_palette <- purrr::pluck(personal_palettes, palette)

  if (reverse) chosen_palette <- rev(chosen_palette)

  thematic_on(
    bg = "white",
    fg = "black",
    accent = personal_colors[[accent]],
    sequential = sequential_gradient(fg_weight = 0, bg_weight = 0.9, fg_low = FALSE),
    qualitative = chosen_palette,
    font = "Roboto"
  )
}

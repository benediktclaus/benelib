#' Save plots for LaTeX reports in correct dimensions
#'
#' This function saves a ggplot2 plot in the desired location with the correct
#' dimensions for a LaTeX report. If a custom thematic theme is used, this only
#' works for vector graphics (e.g., PDF).
#'
#' @param filename Desired filename
#' @param plot Plot
#' @param path Desired path for saving
#' @param width Plot width, defaults to 11.75 cm
#' @param height Plot height, defaults to 9 cm
#' @param units Unit, defaults to `"cm"`
#'
#' @importFrom ggplot2 ggsave
#'
#' @return Nothing, used for side-effects only
#' @export
report_save <- function(filename, plot, width = 11.75, path = "04 Figures", height = 9, units = "cm") {
  ggplot2::ggsave(filename = filename, plot = plot, path = path, width = width, height = height, units = units)
}

#' Save A Plot With Custom Theming
#'
#' The various `use_*` functions from the `benelib` are powered by the
#' `thematic` package. This powerful package makes it possible to use custom
#' Google fonts without worrying about plotting those. However, this comes with
#' a small drawback for saving plots. If one uses ggplot2's
#' [`ggsave`][ggplot2::ggsave()] function, text may be rendered too small in
#' raster images. `thematic` provides a custom function, for which this
#' function is a simple wrapper.
#'
#' In short: if you use a plot theming function from this package and want to
#' save it as a raster image (JPG, PNG, etc.), use this function to save the
#' plot to a desired location.
#'
#'
#' @param plot A ggplot2 plot.
#' @param filename The plot's desired file name.
#' @param path The desired path to which the plot should be saved.
#' @param width Plot width, defaults to 16.
#' @param height Plot height, defaults to 16.
#' @param units Plot dimension unit, defaults to "cm".
#' @param dpi Plot resolution, defaults to 320.
#'
#' @return Nothing, saves plot to disk.
#' @export
save_custom_plot <- function(filename, plot, path, width = 16, height = 16, units = "cm", dpi = 320) {
  thematic::thematic_save_plot(expr = plot, filename = filename, width = width, height = height, units = units, res = dpi)

  fs::file_move(path = filename, new_path = path)
}

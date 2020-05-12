#' Fill scale using the PedScience color scheme
#'
#' Fill scale using the PedScience color scheme in ggplot2.
#'
#' @inheritParams scale_color_pedscience
#'
#' @return The PedScience fill scale for ggplot2.
#' @export
#'
#' @seealso \code{\link{scale_color_pedscience}}
#'
#' @examples
#' library(ggplot2)
#'
#' p <- ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) + geom_boxplot()
#' p + scale_fill_pedscience()
scale_fill_pedscience <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- pedscience_pal(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("fill", scale_name = paste0("pedscience_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), ...)
  }
}

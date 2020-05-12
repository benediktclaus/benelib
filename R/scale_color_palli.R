#' Color scale using the Palliativ color scheme
#'
#' Color scale using the color scheme of the Kinderpalliativzentrum in ggplot2.
#'
#' @inheritParams scale_color_pedscience
#'
#' @return The Kinderpalliativzentrum color scale
#' @export
#'
#' @seealso \code{\link{scale_fill_palli}}
#'
#' @examples
#' library(ggplot2)
#'
#' p <- ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, color = Species)) + geom_point()
#' p + scale_color_palli()
scale_color_palli <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- palli_pal(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("colour", paste0("palli_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_color_gradientn(colours = pal(256), ...)
  }
}

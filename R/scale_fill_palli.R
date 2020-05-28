#' Fill scale using the Palliativ color scheme
#'
#' Fill scale using the color scheme of the Kinderpalliativzentrum in ggplot2.
#'
#' @inheritParams scale_color_pedscience
#'
#' @return The Kinderpalliativzentrum fill scale.
#' @export
#'
#' @seealso \code{\link{scale_color_palli}}
#'
#' @examples
#' library(ggplot2)
#'
#' p <- ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) + geom_boxplot()
#' p + scale_fill_palli()
scale_fill_palli <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- palli_pal(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("fill", scale_name = paste0("palli_", palette), palette = pal, na.value = "grey80", ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), na.value = "grey80", ...)
  }
}

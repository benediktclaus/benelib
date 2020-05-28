#' Color scale using the DKSZ color scheme
#'
#' Color scale using the color scheme od the DKSZ in ggplot2.
#'
#' @inheritParams scale_color_pedscience
#'
#' @return The DKSZ color scale for ggplot2.
#' @export
#'
#' @seealso \code{\link{scale_fill_dksz}}
#'
#' @examples
#' library(ggplot2)
#'
#' p <- ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, color = Species)) + geom_point()
#' p + scale_color_dksz()
scale_color_dksz <- function(palette = "main", discrete = TRUE, reverse = FALSE, na.value = "grey70", ...) {
  pal <- dksz_pal(palette = palette, reverse = reverse)
  na_value <- na.value

  if (discrete) {
    ggplot2::discrete_scale("colour", paste0("dksz_", palette), palette = pal, na.value = na_value, ...)
  } else {
    ggplot2::scale_color_gradientn(colours = pal(256), na.value = na_value, ...)
  }
}

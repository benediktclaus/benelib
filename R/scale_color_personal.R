#' Color scale using my personal color scheme
#'
#' Color scale using my personal color scheme in ggplot2.
#'
#' @inheritParams scale_color_pedscience
#'
#' @return My personal color scale for ggplot2.
#' @export
#'
#' @seealso \code{\link{scale_fill_personal}}
#'
#' @examples
#' library(ggplot2)
#'
#' p <- ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, color = Species)) + geom_point()
#' p + scale_color_personal()
scale_color_personal <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- personal_pal(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("colour", paste0("personal_", palette), palette = pal, na.value = "grey80", ...)
  } else {
    ggplot2::scale_color_gradientn(colours = pal(256), na.value = "grey80", ...)
  }
}

#' Fill scale using my personal color scheme
#'
#' Fill scale using my personal color scheme in ggplot2.
#'
#' @inheritParams scale_color_pedscience
#'
#' @return My personal fill scale for ggplot2.
#' @export
#'
#' @seealso \code{\link{scale_color_personal}}
#'
#' @examples
#' library(ggplot2)
#'
#' p <- ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) + geom_boxplot()
#' p + scale_fill_personal()
scale_fill_personal <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- personal_pal(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("fill", scale_name = paste0("personal_", palette), palette = pal, na.value = "grey80", ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), na.value = "grey80", ...)
  }
}

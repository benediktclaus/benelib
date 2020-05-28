#' Color scale using the PedScience color scheme
#'
#' Color scale using the PedScience color scheme in ggplot2.
#'
#' @param palette String, the color palette to use (defaults to \code{"main"}).
#'   There are several options available: \code{"main"}, \code{"playful"},
#'   \code{"heat"} (for heat maps), \code{"full"}, \code{"decent"}, and
#'   \code{"bright"}.
#' @param discrete Logical, defaults to \code{TRUE}. Set to \code{FALSE} when
#'   using a continuous scale.
#' @param reverse Logical, defaults to \code{FALSE}. Setting this to \code{TRUE}
#'   changes the order of the colors.
#' @param na.value String, the color for NA values.
#' @param ... Additional arguments passed to \code{\link[ggplot2]{scale_color_gradientn}}.
#'
#' @return The PedScience color scale for ggplot2.
#' @export
#'
#' @seealso \code{\link{scale_fill_pedscience}}
#'
#' @examples
#' library(ggplot2)
#'
#' p <- ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, color = Species)) + geom_point()
#' p + scale_color_pedscience()
scale_color_pedscience <- function(palette = "main", discrete = TRUE, reverse = FALSE, na.value = "grey80", ...) {
  pal <- pedscience_pal(palette = palette, reverse = reverse)
  na_value <- na.value

  if (discrete) {
    ggplot2::discrete_scale("colour", paste0("pedscience_", palette), palette = pal, na.value = na_value, ...)
  } else {
    ggplot2::scale_color_gradientn(colours = pal(256), na.value = na_value, ...)
  }
}

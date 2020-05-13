#' mean_sd
#'
#' Compute mean and standard deviation for a given vector. Can be used as
#' \code{fun.data} in ggplot2's \code{\link[ggplot2]{stat_summary}}. This comes
#' in very handy for plotting means and standard deviations as no further
#' arguments must be submitted.
#'
#' @param x A numeric vector.
#'
#' @return A tibble with columns \code{ymin}, \code{mean}, and \code{ymax}.
#' @export
#'
#' @examples
#' x <- rnorm(200)
#'
#' mean_sd(x)
mean_sd <- function(x) {

  if (!is.numeric(x)) {
    stop("x must be a numeric vector")
  }

  mean_x <- mean(x, na.rm = TRUE)
  sd_x <- stats::sd(x, na.rm = TRUE)

  data.frame("y" = mean_x,
             "ymin" = mean_x - sd_x,
             "ymax" = mean_x + sd_x)
}

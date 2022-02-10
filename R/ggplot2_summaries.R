#' Compute Mean and its Standard Deviation for ggplot2
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


#' Compute Trimmed Mean and its Standard Error for ggplot2
#'
#' Compute 20% trimmed mean and standard error for a given vector. Can be used
#' as \code{fun.data} in ggplot2's \code{\link[ggplot2]{stat_summary}}.
#'
#' @param x A numeric vector.
#'
#' @return A tibble with columns \code{ymin}, \code{mean}, and \code{ymax}.
#' @export
#'
#' @examples
#' x <- rnorm(200)
#'
#' tr_mean_se(x)
tr_mean_se <- function(x) {
  if (!is.numeric(x)) {
    stop("x must be a numeric vector")
  }

  mean_x <- mean(x, trim = 0.2, na.rm = TRUE)
  sd_x <- WRS2::trimse(x, tr = 0.2, na.rm = TRUE)

  data.frame("y" = mean_x,
             "ymin" = mean_x - sd_x,
             "ymax" = mean_x + sd_x)
}


#' Compute Winsorized Mean and its Standard Error for ggplot2
#'
#' Compute 20% winsorized mean and standard error for a given vector. Can be used
#' as \code{fun.data} in ggplot2's \code{\link[ggplot2]{stat_summary}}.
#'
#' @param x A numeric vector.
#'
#' @return A tibble with columns \code{ymin}, \code{mean}, and \code{ymax}.
#' @export
#'
#' @examples
#' x <- rnorm(200)
#'
#' win_mean_se(x)
win_mean_se <- function(x) {
  if (!is.numeric(x)) {
    stop("x must be a numeric vector")
  }

  mean_x <- WRS2::winmean(x, tr = 0.2, na.rm = TRUE)
  sd_x <- WRS2::winse(x, tr = 0.2)

  data.frame("y" = mean_x,
             "ymin" = mean_x - sd_x,
             "ymax" = mean_x + sd_x)
}


#' Compute Median and its Standard Error for ggplot2
#'
#' Compute median and its standard error for a given vector. Can be used as
#' \code{fun.data} in ggplot2's \code{\link[ggplot2]{stat_summary}}.
#'
#' @param x A numeric vector.
#'
#' @return A tibble with columns \code{ymin}, \code{mean}, and \code{ymax}.
#' @export
#'
#' @examples
#' x <- rnorm(200)
#'
#' median_se(x)
median_se <- function(x) {
  if (!is.numeric(x)) {
    stop("x must be a numeric vector")
  }

  mean_x <- stats::median(x, na.rm = TRUE)
  sd_x <- WRS2::msmedse(x, sewarn = FALSE)

  data.frame("y" = mean_x,
             "ymin" = mean_x - sd_x,
             "ymax" = mean_x + sd_x)
}


#' Compute M-Estimator and its Standard Error for ggplot2
#'
#' Compute M-estimator and its standard error for a given vector. Can be used as
#' \code{fun.data} in ggplot2's \code{\link[ggplot2]{stat_summary}}.
#'
#' @param x A numeric vector.
#'
#' @return A tibble with columns \code{ymin}, \code{mean}, and \code{ymax}.
#' @export
#'
#' @examples
#' x <- rnorm(200)
#'
#' mest_se(x)
mest_se <- function(x) {
  if (!is.numeric(x)) {
    stop("x must be a numeric vector")
  }

  mean_x <- WRS2::mest(x, na.rm = TRUE)
  sd_x <- WRS2::mestse(x)

  data.frame("y" = mean_x,
             "ymin" = mean_x - sd_x,
             "ymax" = mean_x + sd_x)
}

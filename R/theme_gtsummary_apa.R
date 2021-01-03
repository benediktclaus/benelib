#' APA-like gtsummary theme
#'
#' Set an APA-like theme for \code{gtsummary} tables, i.e. means and standard
#' deviations with two decimals are calculated for continuous variables, the
#' Welch test (as the default t.test function in R calculates a Welch test) is
#' the default statistical test for a two group comparison, and the method for
#' correcting p-values is the false discovery rate correction.
#'
#' @importFrom gtsummary set_gtsummary_theme
#'
#' @param set_theme Logial, defaults to TRUE. Indicates whether the theme should
#'   be loaded.
#'
#' @return An APA-like gtsummary table
#' @export
#' @md
#'
#' @seealso [theme_gt_apa()]
#'
#'
#' @examples
#' library(gtsummary)
#' theme_gtsummary_apa()
#'
#' trial %>%
#'  select(trt, age, response, ttdeath) %>%
#'  tbl_summary(by = trt) %>%
#'  add_n() %>%
#'  add_p() %>%
#'  add_q(quiet = TRUE)
theme_gtsummary_apa <- function(set_theme = TRUE) {
  lst_theme <- list(
    "pkgwide-str:theme_name" = "APA",
    "tbl_summary-str:continuous_stat" = "{mean} ({sd})",
    "tbl_summary-arg:missing" = "no",
    "add_p.tbl_summary-attr:test.continuous_by2" = "t.test",
    "tbl_summary-arg:digits" = list(all_continuous() ~ c(2, 2)),
    "add_q-arg:method" = "fdr"
  )

  if (set_theme == TRUE) set_gtsummary_theme(lst_theme)
  return(invisible(lst_theme))
}

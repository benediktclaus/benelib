#' APA-Like Table Style
#'
#' Style a `gt` table minimally with an APA-like style.
#'
#' @importFrom gt cols_align opt_table_lines tab_options
#'
#' @param table A `gt` table
#'
#' @return A formatted `gt` table
#' @export
#'
#' @examples
#' library(gt)
#'
#' mtcars %>%
#' gt() %>%
#' theme_gt_apa()
theme_gt_apa <- function(table) {
  table %>%
    cols_align(columns = 1, align = "left") %>%
    opt_table_lines(extent = "none") %>%
    tab_options(
      table.border.top.style = "solid",
      table.border.top.color = "black",
      table.border.top.width = 1,
      table_body.border.bottom.style = "solid",
      table_body.border.bottom.color = "black",
      table_body.border.bottom.width = 1,
      column_labels.border.bottom.style = "solid",
      column_labels.border.bottom.color = "black",
      column_labels.border.bottom.width = 1,
      column_labels.font.weight = "bold"
    )
}

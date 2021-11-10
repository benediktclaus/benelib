#' Binded Function To Set Up Personal Project
#'
#' Function used by RStudio to setup a personal project.
#'
#' @param path Path, where project should be created
#' @param ... Optional arguments
#'
#' @importFrom fs path
#' @importFrom purrr walk
#'
#' @noRd
personal_project <- function(path, ...) {
  arguments <- list(...)
  template_path <- path(path_package("benelib"), "script-templates")

  # Create project folder
  dir_create(path = path)


  # Create subfolders
  folder_list <- list("Raw Data", "Data", "R", "Figures", "Reports")
  folder_list %>%
    walk(~ use_custom_folder(path, folder_name = .))


  # Include additional folders if checked in the menu
  if (arguments[["literature"]]) use_custom_folder(path, "Literature")
  if (arguments[["article"]])    use_custom_folder(path, "Article")
  if (arguments[["misc"]])       use_custom_folder(path, "Miscellaneous")


  # Create Cleaning and Analyses Files if checked
  if (arguments[["cleaning-csv"]])   use_data_cleaning_template(path(path, "03 R"), file_format = "csv")
  if (arguments[["cleaning-spss"]])  use_data_cleaning_template(path(path, "03 R"), file_format = "spss")
  if (arguments[["cleaning-excel"]]) use_data_cleaning_template(path(path, "03 R"), file_format = "excel")
  if (arguments[["analyses"]])       use_analysis_template(path(path, "03 R"))
}


#' Create Folder Name
#'
#' Create folder name based on number of folders in the current working
#' directory. If n folders exist, a folder with number n + 1 will be created
#' (with leading 0 for numbers < 10 for nice layout)
#'
#' @param path Where should the folder be created?
#' @param name What should the folder be called? This must be a string.
#'
#' @importFrom fs dir_info
#' @importFrom stringr str_pad str_c
#'
#' @noRd
create_folder_name <- function(path, name) {
  folder_number <- nrow(dir_info(path, type = "directory")) + 1
  folder_number_formatted <- str_pad(folder_number, 2, pad = 0)

  str_c(folder_number_formatted, name, sep = " ")
}



#' Check Existing Folders
#'
#' Check if folder name already exists in current working directory. Returns
#' `TRUE` of so.
#'
#' @inheritParams create_folder_name
#'
#' @importFrom fs dir_ls
#' @importFrom stringr str_detect
#'
#' @noRd
is_already_here <- function(path, name) {
  detected_strings <-  str_detect(dir_ls(path, type = "directory"), str_c("^.*\\d{1,2} ", name, "$"))

  TRUE %in% detected_strings
}



#' Create A Custom Folder
#'
#' Create a new folder with formatted number and custom name in the current
#' working directory. The newly created folder will be labelled with the number
#' n + 1 with n being the number of folders already existent in the working
#' directory. If a folder with the same name (must not be the same number)
#' already exists, you can choose to add another one with the same name (and
#' different number).
#'
#' @param path Where should the folder be created?
#' @param folder_name What should the folder be called? This must be a string.
#' @param add Should the folder be added even if the name already exists?
#'   Defaults to `FALSE`.
#'
#' @importFrom fs dir_create path_wd
#'
#' @export
use_custom_folder <- function(path = NA, folder_name, add = FALSE) {
  # Check if arguments have correct format
  if (is.na(path)) path <- path_wd()
  if (!is.character(path)) stop("The folder path must be a string.")
  if (!is.character(folder_name)) stop("The folder name must be a string.")

  # Check if folder already exists
  if (!add) {
    if (is_already_here(path, folder_name)) stop("The project already contains the \"", folder_name, "\" folder. Are you sure you want to add another one? If so, use \"add = TRUE\"")
  }

  new_folder_name <- create_folder_name(path, folder_name)

  dir_create(path, new_folder_name)
}

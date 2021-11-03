#' Binded Function To Set Up Personal Project
#'
#' Function used by RStudio to setup a personal project.
#'
#' @param path Path, where project should be created
#' @param ... Optional arguments
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
  if (arguments[["report"]])     use_custom_folder(path, "Report")
  if (arguments[["literature"]]) use_custom_folder(path, "Literature")
  if (arguments[["article"]])    use_custom_folder(path, "Article")
  if (arguments[["misc"]])       use_custom_folder(path, "Miscellaneous")


  # Create Cleaning and Analyses Files if checked
  if (arguments[["cleaning-csv"]])   file_copy(path = path(template_path, "data-cleaning-csv.R"),   new_path = path(path, "03 R", "data-cleaning-csv.R"))
  if (arguments[["cleaning-spss"]])  file_copy(path = path(template_path, "data-cleaning-spss.R"),  new_path = path(path, "03 R", "data-cleaning.R"))
  if (arguments[["cleaning-excel"]]) file_copy(path = path(template_path, "data-cleaning-excel.R"), new_path = path(path, "03 R", "data-cleaning.R"))
  if (arguments[["analyses"]])       file_copy(path = path(template_path, "analyses.R"),            new_path = path(path, "03 R", "analyses.R"))
}


# Create folder name based on number of current folders
create_folder_name <- function(path, name) {
  folder_number <- nrow(dir_info(path, type = "directory")) + 1
  folder_number_formatted <- str_pad(folder_number, 2, pad = 0)

  str_c(folder_number_formatted, name, sep = " ")
}


# Check if folder name already exists
is_already_here <- function(path, name) {
  detected_strings <- dir_ls(path, type = "directory") %>%
    str_detect(., str_c("^.*\\d{1,2} ", name, "$"))

  TRUE %in% detected_strings
}


# Create a new folder with formatted number and given name
use_custom_folder <- function(path, folder_name, add = FALSE) {
  # Check if arguments have correct format
  if (!is.character(path)) stop("The directory path must be a string.")
  if (!is.character(folder_name)) stop("The folder name must be a string.")

  # Check if folder already exists
  if (!add) {
    if (is_already_here(path, folder_name)) stop("The project already contains the \"", folder_name, "\" folder. Are you sure you want to add another one? If so, use \"add = TRUE\"")
  }

  new_folder_name <- create_folder_name(path, folder_name)

  dir_create(path, new_folder_name)
}

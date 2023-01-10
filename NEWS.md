# benelib 1.1.0
* Include option to specify a custom palette as vector of HEX codes
* Implement optimized color palettes
* Change argument order of `use_custom_folder()` to provide a folder name directly
* Add potential custom theming for ggplot2 facets, this omits the default grey backgrounds and white font color

# benelib 1.0.0
* First stable release
* All theming functions are noe more reliably rewritten

# benelib 0.11.0
* Add `report_save()` function

# benelib 0.10.0
* Add ggplot2 summary functions for `stat_summary()` (e.g., `mean_sd()`)

# benelib 0.9.1

* Add `open_working_directory()`, a little helper to open the current working directory
* `use_custom_folder()` can now be used without a path. If `path = NA`, the folder will be created in the current working directory.

# benelib 0.9.0

* The benelib now uses a completely new personal project setup function, employing mainly the new `use_custom_folder()` and `use_.*_template()` functions. This not only makes the project function much easier to maintain but also gives the end user more flexibility when projects are already created.
* `use_custom_folder()` can be used to create a custom folder in the current working directory. It will check if the chosen name is already i()n use and adds the new folder with the next seriated number.
* `use_analysis_template` can be used to create a skeleton for a potential analyses with my most used packages and setups.
* `use_data_cleaning_template()` can be used to include a skeleton for cleaning and wrangling raw data files for CSV, XLSX (Excel) and SAV (SPSS) files
* `use_latex_template()` creates a folder containing a LaTeX document with prepopulated preamble and filler text to get going fast.

# benelib 0.8.1

* Eradicated the graphics device error when a custom corporate plot theme was used and the first plot was produced (originated in the showtext package)

# benelib 0.8.0
## Breaking changes

* The corporate theming functions now use the `usethis`-style prefix `use_*` instead of `set_*`.
* Now, those plots with custom corporate theming can be saved with `save_custom_plot()`, which renders fonts (i.e., the font size) correctly.

# benelib 0.7.1

* Patch to include an analysis paragraph in the analysis document template.

# benelib 0.7.0

* Included the correct font specification for themes.

# benelib 0.6.0

* ggplot2 themes are rewritten from sratch employing the thematic package which is more consistent and stable.

# benelib 0.5.0

* Added separate cleaning scripts for CS, SPSS, and Excel files

# benelib 0.4.0

* Added functionality to the RStudio template. Now, one can choose if certain directories or prepopulated files should be included in the project
* Fixed minor issues with the package website

# benelib 0.3.0

* Added a new README

# benelib 0.2.0

* Added a `NEWS.md` file to track changes to the package.
* Updated documentaton for color and fill scales for custom `ggplot2` designs

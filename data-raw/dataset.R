palmer_penguins <- readr::read_rds("data-raw/penguins.rds") %>%
  na.omit()

use_data(palmer_penguins, overwrite = TRUE)


# Color list
theming_colors <- list(
  personal = c(
    blue = "#004358",
    dark_green = "#1F8A70",
    green = "#BEDB39",
    yellow = "#FFE11A",
    orange = "#FD7400",
    grey = "#BBBED0"
  ),
  pedscience = c(
    blue = "#2356a3",
    coral = "#e04313",
    baby_blue = "#00b0d1",
    dark_grey = "#4c4949",
    light_grey = "#9198a8",
    light_blue = "#C0D3F0"
  ),
  palli = c(
    green = "#94c11f",
    orange = "#ed8a0d",
    yellow = "#fbb900",
    blue = "#009fe3",
    grey = "#bebebe"
  ),
  dksz = c(
    red = "#d70014",
    orange = "#eb6e00",
    green = "#5fa916",
    blue = "#0094e6",
    purple = "#ff9900",
    grey = "#787878"
  ),
  pomological = c(
    red = "#c03728",
    green = "#919c4c",
    orange = "#fd8f24",
    yellow = "#f5c04a",
    rose = "#e68c7c",
    greyblue = "#828585",
    lightgreen = "#c3c377",
    grey = "#4f5157",
    brown = "#6f5438"
  )
)

use_data(theming_colors, overwrite = TRUE)


# Palette list based on predefined colors
theming_palettes <- list(
  personal = list(
    accent     = theming_colors$personal[["blue"]],
    main       = theming_colors$personal[c("blue", "green", "yellow", "orange", "dark_green")],
    sequential = theming_colors$personal[c("blue", "dark_green", "green", "yellow", "orange")],
    lighter    = colorspace::lighten(theming_colors$personal[c("blue", "green", "yellow", "orange", "dark_green")], amount = 0.2),
    darker     = colorspace::darken(theming_colors$personal[c("blue", "green", "yellow", "orange", "dark_green")], amount = 0.1),
    pastel     = colorspace::lighten(theming_colors$personal[c("blue", "green", "yellow", "orange", "dark_green")], amount = 0.4)
  ),
  pedscience = list(
    accent  = theming_colors$pedscience[["blue"]],
    main    = theming_colors$pedscience[c("blue", "coral", "dark_grey", "baby_blue", "light_grey")],
    sequential = theming_colors$pedscience[c("blue", "baby_blue", "light_grey", "dark_grey", "coral")],
    lighter    = colorspace::lighten(theming_colors$pedscience[c("blue", "coral", "dark_grey", "baby_blue", "light_grey")], amount = 0.2),
    darker     = colorspace::darken(theming_colors$pedscience[c("blue", "coral", "dark_grey", "baby_blue", "light_grey")], amount = 0.1),
    pastel     = colorspace::lighten(theming_colors$pedscience[c("blue", "coral", "dark_grey", "baby_blue", "light_grey")], amount = 0.4)
  ),
  palli = list(
    accent      = theming_colors$palli[["green"]],
    main        = theming_colors$palli[c("green", "orange", "yellow", "blue", "grey")],
    sequential  = theming_colors$palli[c("orange", "yellow", "green", "blue", "grey")],
    lighter     = colorspace::lighten(theming_colors$palli[c("green", "orange", "yellow", "blue", "grey")], amount = 0.2),
    darker      = colorspace::darken(theming_colors$palli[c("green", "orange", "yellow", "blue", "grey")], amount = 0.1),
    pastel      = colorspace::lighten(theming_colors$palli[c("green", "orange", "yellow", "blue", "grey")], amount = 0.4)
  ),
  dksz = list(
    accent  = theming_colors$dksz[["red"]],
    main    = theming_colors$dksz[c("red", "green", "purple", "blue", "orange", "grey")],
    sequential    = theming_colors$dksz[c("red", "orange", "purple", "green", "blue", "grey")],
    lighter     = colorspace::lighten(theming_colors$dksz[c("red", "green", "purple", "blue", "orange", "grey")], amount = 0.2),
    darker      = colorspace::darken(theming_colors$dksz[c("red", "green", "purple", "blue", "orange", "grey")], amount = 0.1),
    pastel      = colorspace::lighten(theming_colors$dksz[c("red", "green", "purple", "blue", "orange", "grey")], amount = 0.4)
  ),
  pomological = list(
    accent = theming_colors$pomological[["green"]],
    main = theming_colors$pomological,
    lighter = colorspace::lighten(theming_colors$pomological, amount = 0.2),
    darker = colorspace::darken(theming_colors$pomological, amount = 0.1)
  )
)

use_data(theming_palettes, overwrite = TRUE)

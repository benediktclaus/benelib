palmer_penguins <- read_rds("data-raw/penguins.rds") %>%
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
  )
)

use_data(theming_colors, overwrite = TRUE)


# Palette list based on predefined colors
theming_palettes <- list(
  personal = list(
    accent = theming_colors$personal[["blue"]],
    main = theming_colors$personal[c("blue", "green", "yellow")],
    playful = theming_colors$personal[c("dark_green", "green", "yellow")],
    full = theming_colors$personal[c("blue", "dark_green", "green", "yellow", "orange")],
    decent = theming_colors$personal[c("blue", "dark_green", "grey")],
    bright = theming_colors$personal[c("green", "yellow", "orange")]
  ),
  pedscience = list(
    accent = theming_colors$pedscience[["blue"]],
    main = theming_colors$pedscience[c("blue", "coral", "light_grey")],
    playful = theming_colors$pedscience[c("blue", "coral", "baby_blue")],
    full = theming_colors$pedscience[c("blue", "coral", "dark_grey", "baby_blue")],
    decent = theming_colors$pedscience[c("blue", "dark_grey", "light_grey")],
    bright = theming_colors$pedscience[c("coral", "baby_blue", "light_grey")]
  ),
  palli = list(
    accent = theming_colors$palli[["green"]],
    main = theming_colors$palli[c("green", "orange", "yellow")],
    playful = theming_colors$palli[c("green", "yellow", "blue")],
    full = theming_colors$palli[c("green", "orange", "yellow", "blue", "grey")],
    decent = theming_colors$palli[c("green", "blue", "grey")],
    bright = theming_colors$palli[c("green", "yellow", "orange", "blue")]
  ),
  dksz = list(
    accent = theming_colors$dksz[["red"]],
    main = theming_colors$dksz[c("red", "orange", "green")],
    playful = theming_colors$dksz[c("orange", "green", "blue")],
    full = theming_colors$dksz[c("red", "orange", "green", "blue", "purple", "grey")],
    decent = theming_colors$dksz[c("red", "blue", "grey")],
    bright = theming_colors$dksz[c("red", "green", "blue")]
  )
)

use_data(theming_palettes, overwrite = TRUE)

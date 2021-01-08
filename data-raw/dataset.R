palmer_penguins <- read_rds("data-raw/penguins.rds") %>%
  na.omit()

use_data(palmer_penguins, overwrite = TRUE)


# benelib

The `benelib` contains some little helper functions for my commonly
executed tasks, and thus a convenient workflow in R.

It can be downloaded, installed, and finally loaded via

``` r
remotes::install_github("benediktclaus/benelib")

library(benelib)
```

## Color schemes

There are color schemes for the PedScience Vestische Forschungs-gGmbH,
the Kinderpalliativzentrum, and Deutsches Kinderschmerzzentrum in
Datteln for `ggplot2`.

Those can be used via `scale_color_*` oder `scale_fill_*` and the
respective name of the color scheme’s institution (i.e. “pedscience”,
“palli”, or “dksz”). By giving the argument `discrete = FALSE`, those
can be mapped to continuous variables as well.

``` r
base_plot <- ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point(size = 3)
  
base_plot +
  scale_color_pedscience()
```

![](README_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

All of those contain six different palettes to fulfill everyone’s needs.
These palettes are

  - `main`,
  - `plaful`,
  - `heat` (for heatmaps),
  - `full` (which includes all colors),
  - `decent`, and
  - `bright`.

<!-- end list -->

``` r
base_plot +
  scale_color_pedscience(palette = "bright")
```

![](README_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

``` r
base_plot +
  scale_color_pedscience(palette = "decent")
```

![](README_files/figure-gfm/unnamed-chunk-4-2.png)<!-- -->

## ggplot2 Theme

There is also a tailored version of ggplot2’s `theme_light()`, namely
`theme_bene()`, which uses Google’s [Roboto font
family](https://fonts.google.com/specimen/Roboto?query=Roboto).

``` r
base_plot +
  scale_color_pedscience() +
  theme_bene()
```

![](README_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

For this, make sure the Roboto font (see above) is installed and the
`extrafont` package is installed. After installing the font, all windows
fonts need to be imported via `extrafont::font_import()` and then loaded
via `extrafont::load_fonts()` once.

## R Markdown Templates

The package includes two R markdown templates for fast and easy access.
There is a “Personal Template” for personal communication and “costat
Page” with correct settings for working on the [Chamber of
Statistics](https://benediktclaus.github.io/costat/).

These can be used via `New File` , `R Markdown...` and `From Template`.

## RStudio Project Template

To ensure a common file structure for research projects, an RStudio
Project Template is also included.

This can be used via `New Project...`

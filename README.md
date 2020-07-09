
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
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  geom_point(size = 3) +
  scale_color_pedscience()
```

![](README_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

All of those contain six different palettes to fulfill everyone’s needs.
These palettes are

  - “main”,
  - “plaful”,
  - “heat” (for heatmaps),
  - “full” (which includes all colors),
  - “decent”, and
  - “bright”.

<!-- end list -->

``` r
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  geom_point(size = 3) +
  scale_color_pedscience(palette = "bright")
```

![](README_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

``` r
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  geom_point(size = 3) +
  scale_color_pedscience(palette = "decent")
```

![](README_files/figure-gfm/unnamed-chunk-4-2.png)<!-- -->

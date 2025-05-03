suezalla
================

# suezalla: A custom ggplot2 theme and colour palette

`suezalla` is a lightweight R package that provides:

- Custom `ggplot2` themes: `theme_suezalla()` and `suez_theme_vintage()`
- Multiple curated colour palettes inspired by polaroids, jam jars,
  retro aesthetics, and corporate branding
- Custom `ggplot2` scale functions: `scale_colour_suezalla()` and
  `scale_fill_suezalla()`

These tools help create consistent, beautiful visualizations with
minimal effort.

------------------------------------------------------------------------

## Available palettes

You can use the following palettes with `suezalla_palette()`,
`scale_colour_suezalla()`, and `scale_fill_suezalla()`:

| Palette Name | Description | Swatches |
|----|----|----|
| `polaroid` | Soft pastel colours inspired by vintage photos | <span style="background:#45AAB4">   </span> <span style="background:#038DB2">   </span> <span style="background:#206491">   </span> <span style="background:#F9637C">   </span> <span style="background:#FE7A66">   </span> <span style="background:#FBB45C">   </span> |
| `vibrant` | Bright, high-contrast colours that pop | <span style="background:#FFC567">   </span> <span style="background:#FD5A46">   </span> <span style="background:#00995E">   </span> <span style="background:#FB7DA8">   </span> <span style="background:#552CB7">   </span> <span style="background:#058CD7">   </span> |
| `jam` | Rich, warm colours reminiscent of fruit preserves | <span style="background:#FBC9BE">   </span> <span style="background:#DB7B65">   </span> <span style="background:#ECB865">   </span> <span style="background:#695356">   </span> <span style="background:#255F63">   </span> |
| `corporate` | Clean, professional tones for business-style plots | <span style="background:#23C2A2">   </span> <span style="background:#EC3431">   </span> <span style="background:#FBDE21">   </span> <span style="background:#138ABD">   </span> <span style="background:#9BBAFA">   </span> |
| `lively1` | Lively and energetic colour combinations | <span style="background:#ED5565">   </span> <span style="background:#FFCE54">   </span> <span style="background:#48CFAD">   </span> <span style="background:#5D9CEC">   </span> <span style="background:#FC6E51">   </span> <span style="background:#A0D468">   </span> <span style="background:#4FC1E9">   </span> <span style="background:#AC92EC">   </span> |
| `lively2` | Another bold, dynamic palette | <span style="background:#DA4453">   </span> <span style="background:#F6BB42">   </span> <span style="background:#37BC98">   </span> <span style="background:#4A89DC">   </span> <span style="background:#E9573F">   </span> <span style="background:#8CC152">   </span> <span style="background:#3BAFDA">   </span> <span style="background:#967ADC">   </span> |
| `retro` | Mid-century modern-inspired retro colours | <span style="background:#E7363C">   </span> <span style="background:#F56438">   </span> <span style="background:#FCAB20">   </span> <span style="background:#59AC99">   </span> <span style="background:#3E446E">   </span> |
| `autumn` | Warm seasonal tones found in autumn | <span style="background:#388388">   </span> <span style="background:#4ABFBD">   </span> <span style="background:#8AB17D">   </span> <span style="background:#E9C46A">   </span> <span style="background:#F4A261">   </span> <span style="background:#E76F51">   </span> |

To preview or generate palettes programmatically:

``` r
# Return 5 colours from the 'retro' palette (discrete)
suezalla_palette("retro", n = 5)

# Create a 12-colour continuous gradient based on 'autumn'
suezalla_palette("autumn", n = 12, type = "continuous")
```

------------------------------------------------------------------------

## Quick example

``` r
library(suezalla)
library(ggplot2)

ggplot(mtcars, aes(x = wt, y = mpg, colour = factor(cyl))) +
  geom_point(size = 3) +
  scale_colour_suezalla(palette_name = "jam") +
  theme_suezalla() +
  labs(
    title = "Car efficiency by weight",
    x = "Weight",
    y = "Miles per Gallon",
    colour = "Cylinders"
  )
```

------------------------------------------------------------------------

## Installation

``` r
# If you don't already have devtools
install.packages("devtools")

# Install directly from GitHub
devtools::install_github("sucanavan/suezalla")
```

------------------------------------------------------------------------

## License

MIT © Susan Canavan, 2025

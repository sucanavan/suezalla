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

## Installation

Install directly from GitHub using `devtools`:

``` r
# If you don't already have devtools:
install.packages("devtools")

# Install suezalla from GitHub
devtools::install_github("sucanavan/suezalla")
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

## Available palettes

You can use the following palettes with `suezalla_palette()`,
`scale_colour_suezalla()`, and `scale_fill_suezalla()`:

| Palette Name  | Description                                                 |
|---------------|-------------------------------------------------------------|
| `"polaroid"`  | Soft pastel colours inspired by vintage photos              |
| `"vibrant"`   | Bright, high-contrast colours that pop                      |
| `"jam"`       | Rich, warm colours reminiscent of jam and fruit preserves   |
| `"corporate"` | Clean, professional tones suitable for business-style plots |
| `"lively1"`   | Lively and energetic combinations of multiple colours       |
| `"lively2"`   | A second set of dynamic, colourful tones                    |
| `"retro"`     | Mid-century modern-inspired retro colours                   |
| `"autumn"`    | Warm seasonal tones found in autumn landscapes              |

To preview or generate palettes programmatically:

``` r
# Return 5 colours from the 'retro' palette (discrete)
suezalla_palette("retro", n = 5)

# Create a 12-colour continuous gradient based on 'autumn'
suezalla_palette("autumn", n = 12, type = "continuous")
```

------------------------------------------------------------------------

## License

MIT © Susan Canavan, 2025

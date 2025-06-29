suezalla
================

# suezalla: A custom ggplot2 theme and colour palette

`suezalla` is a lightweight R package that provides:

- Custom `ggplot2` themes: `theme_suezalla()`, `theme_zombie()`,
  `theme_academic1940()`, and `theme_academic1940_pattern()`
- Several curated colour palettes inspired by polaroids, jam jars, retro
  aesthetics, zombies, and classic scientific graphics
- Pattern fill utilities for `ggpattern`, including
  `suezalla_academic_style()`
- Custom scale functions: `scale_colour_suezalla()` and
  `scale_fill_suezalla()`

These tools help you create clean, consistent, or stylistically bold
visualizations with minimal effort.

------------------------------------------------------------------------

## Installation

Install the development version of `suezalla` from GitHub using
`devtools`:

``` r
# If not already installed
install.packages("devtools")

# Install suezalla
devtools::install_github("sucanavan/suezalla")
```

------------------------------------------------------------------------

## Available palettes

Use with `suezalla_palette()`, `scale_colour_suezalla()`, or
`scale_fill_suezalla()`:

| Palette | Description | Hex codes (discrete) |
|----|----|----|
| `polaroid` | Soft pastel colours inspired by vintage photography | `#45AAB4`, `#038DB2`, `#206491`, `#F9637C`, `#FE7A66`, `#FBB45C` |
| `vibrant` | Bright, high-contrast colours | `#FFC567`, `#FD5A46`, `#00995E`, `#FB7DA8`, `#552CB7`, `#058CD7` |
| `jam` | Rich, warm colours reminiscent of jam | `#FBC9BE`, `#DB7B65`, `#ECB865`, `#695356`, `#255F63` |
| `corporate` | Clean, professional business tones | `#23C2A2`, `#EC3431`, `#FBDE21`, `#138ABD`, `#9BBAFA` |
| `lively1` | Energetic, colorful combinations | `#ED5565`, `#FFCE54`, `#48CFAD`, `#5D9CEC`, `#FC6E51`, `#A0D468`, `#4FC1E9`, `#AC92EC` |
| `lively2` | Another bold and dynamic palette | `#DA4453`, `#F6BB42`, `#37BC98`, `#4A89DC`, `#E9573F`, `#8CC152`, `#3BAFDA`, `#967ADC` |
| `retro` | Nostalgic, mid-century colours | `#E7363C`, `#F56438`, `#FCAB20`, `#59AC99`, `#3E446E` |
| `autumn` | Warm seasonal tones | `#388388`, `#4ABFBD`, `#8AB17D`, `#E9C46A`, `#F4A261`, `#E76F51` |
| `zombie` | Gritty, earthy tones ideal for bold plots | `grey70`, `#F56438`, `#59AC99` |
| `academic` | Greyscale palette for old-style scientific plots | `black`, `grey10`, `grey40`, `grey70`, `white` |

``` r
# Return 4 discrete colours
suezalla_palette("jam", n = 4)

# Return 10 interpolated colours from the 'autumn' palette
suezalla_palette("autumn", n = 10, type = "continuous")
```

------------------------------------------------------------------------

## Fonts

The `suezalla` package auto-loads:

- **Roboto** from Google Fonts for `theme_suezalla()`
- **XKCD** (if available locally) for `theme_zombie()`
- **Abhaya Libre** for academic themes (`theme_academic1940()`)

These are handled automatically via `sysfonts` and `showtext` when the
package is attached.

------------------------------------------------------------------------

## Quick examples

### Magazine

``` r
library(suezalla)
library(ggplot2)

ggplot(mtcars, aes(x = wt, y = mpg, colour = factor(cyl))) +
  geom_point(size = 3) +
  scale_colour_suezalla(palette_name = "jam") +
  theme_magazine() +
  labs(
    title = "Car efficiency by weight",
    x = "Weight",
    y = "Miles per Gallon",
    colour = "Cylinders"
  )
```

### Zombie

``` r
library(suezalla)
library(ggplot2)

ggplot(mtcars, aes(y = wt, x = mpg)) + 
  geom_point(aes(fill = factor(cyl), size = cyl), shape = 21, alpha = 0.8) + 
  scale_fill_suezalla(palette_name = "zombie") + 
  theme_zombie() +
  labs(
    title = "Car efficiency by weight",
    x = "Weight",
    y = "Miles per Gallon",
    colour = "Cylinders"
  )
```

### LaTeX academic plot (clean black & white with serif font)

``` r
library(suezalla)
library(ggplot2)

ggplot(mtcars, aes(x = mpg, y = wt, shape = factor(carb))) +
  geom_point(size = 2, stroke = 0.4) +
  theme_latex() +
  labs(
    title = "Car efficiency by weight",
    x = "Miles per Gallon",
    y = "Weight",
    shape = "Carburetors"
  )
  
```

### Academic 1940

``` r
library(suezalla)
library(ggplot2)

ggplot(mtcars, aes(x = mpg, y = wt, shape = factor(carb))) +
  geom_point(size = 2, stroke = 0.4, color = "black", fill = "white") +
  scale_shape_manual(values = c(0, 1, 2, 3, 4, 5)) +  # adjust if more shapes are needed
  theme_academic1940() +
  labs(
    title = "Car efficiency by weight",
    x = "Miles per Gallon",
    y = "Weight (1000 lbs)",
    shape = "Carburetors"
  )
```

### Academic pattern style (with `ggpattern`)

``` r
library(suezalla)
library(ggplot2)

# Prepare summarized data
df <- aggregate(wt ~ cyl, data = mtcars, FUN = mean)
df$cyl <- factor(df$cyl)

# Apply theme with automatic fill and pattern
ggplot(df, aes(x = cyl, y = wt, fill = cyl, pattern = cyl)) +
  theme_academic1940_pattern(n = 3)
```

------------------------------------------------------------------------

## License

MIT © Susan Canavan, 2025

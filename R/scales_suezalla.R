#' Custom ggplot2 colour scale for suezalla palettes
#'
#' Applies a named suezalla palette to the colour aesthetic in ggplot2.
#'
#' @param palette_name Name of the palette to use (e.g., "jam", "retro")
#' @param n Number of colours to use. If NULL, uses full palette length.
#' @param type Either "discrete" or "continuous"
#' @param ... Additional arguments passed to scale_colour_manual() or scale_colour_gradientn()
#'
#' @return A ggplot2 scale object
#' @export
scale_colour_suezalla <- function(palette_name = "polaroid", n = NULL, type = "discrete", ...) {
  pal <- suezalla_palette(name = palette_name, n = n, type = type)

  if (type == "discrete") {
    ggplot2::scale_colour_manual(values = pal, ...)
  } else {
    ggplot2::scale_colour_gradientn(colours = pal, ...)
  }
}

#' Custom ggplot2 fill scale for suezalla palettes
#'
#' Applies a named suezalla palette to the fill aesthetic in ggplot2.
#'
#' @param palette_name Name of the palette to use (e.g., "autumn", "vibrant")
#' @param n Number of colours to use. If NULL, uses full palette length.
#' @param type Either "discrete" or "continuous"
#' @param ... Additional arguments passed to scale_fill_manual() or scale_fill_gradientn()
#'
#' @return A ggplot2 scale object
#' @export
scale_fill_suezalla <- function(palette_name = "polaroid", n = NULL, type = "discrete", ...) {
  pal <- suezalla_palette(name = palette_name, n = n, type = type)

  if (type == "discrete") {
    ggplot2::scale_fill_manual(values = pal, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal, ...)
  }
}

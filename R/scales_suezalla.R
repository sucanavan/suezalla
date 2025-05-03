#' ggplot2 colour scale using suezalla_palette
#'
#' @param palette_name Name of the palette (default = "polaroid")
#' @param n Number of colours
#' @param type "discrete" or "continuous"
#' @param ... Additional arguments to ggplot2 scale functions
#' @export
scale_colour_suezalla <- function(palette_name = "polaroid", n = NULL, type = "discrete", ...) {
  pal <- suezalla_palette(name = palette_name, n = n, type = type)
  if (type == "discrete") {
    ggplot2::scale_colour_manual(values = pal, ...)
  } else {
    ggplot2::scale_colour_gradientn(colours = pal, ...)
  }
}

#' ggplot2 fill scale using suezalla_palette
#'
#' @export
scale_fill_suezalla <- function(palette_name = "polaroid", n = NULL, type = "discrete", ...) {
  pal <- suezalla_palette(name = palette_name, n = n, type = type)
  if (type == "discrete") {
    ggplot2::scale_fill_manual(values = pal, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal, ...)
  }
}

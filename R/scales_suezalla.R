#' Custom ggplot2 colour scale for suezalla palettes
#'
#' @param palette_name Name of the palette to use
#' @param n Number of colours to use
#' @param type \"discrete\" or \"continuous\"
#' @param ... Additional arguments passed to scale functions
#' @export
scale_colour_suezalla <- function(palette_name = "polaroid", n = NULL, type = "discrete", ...) {
  if (type == "discrete") {
    ggplot2::scale_colour_manual(values = suezalla_palette(name = palette_name, n = n, type = type), ...)
  } else {
    ggplot2::scale_colour_gradientn(colours = suezalla_palette(name = palette_name, n = n, type = type), ...)
  }
}

#' Custom ggplot2 fill scale for suezalla palettes
#'
#' @export
scale_fill_suezalla <- function(palette_name = "polaroid", n = NULL, type = "discrete", ...) {
  if (type == "discrete") {
    ggplot2::scale_fill_manual(values = suezalla_palette(name = palette_name, n = n, type = type), ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = suezalla_palette(name = palette_name, n = n, type = type), ...)
  }
}

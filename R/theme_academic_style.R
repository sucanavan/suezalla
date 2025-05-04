#' Theme: Academic 1940 with Patterns
#'
#' A vintage-style ggplot2 theme inspired by black-and-white academic plots.
#' Designed to work with ggpattern fills and the "academic" palette.
#' Uses the "Abhaya Libre" font if available.
#'
#' @return A ggplot2 theme object
#' @export
#' @importFrom ggplot2 theme element_text element_blank element_line element_rect
#' @importFrom lemon coord_capped_cart
theme_academic1940_pattern <- function() {
  list(
    ggplot2::theme(
      axis.text = ggplot2::element_text(size = 9, color = "black"),
      plot.title = ggplot2::element_blank(),
      panel.grid.major = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      axis.ticks = ggplot2::element_line(color = "black", size = 0.3),
      axis.line = ggplot2::element_line(color = "black", size = 0.3),
      text = ggplot2::element_text(family = "abhaya"),
      legend.position = "right",
      legend.text = ggplot2::element_text(size = 8),
      legend.title = ggplot2::element_text(size = 9, face = "bold"),
      panel.background = ggplot2::element_rect(fill = "white", color = NA),
      plot.background = ggplot2::element_rect(fill = "white", color = NA)
    ),
    lemon::coord_capped_cart(bottom = 'both', left = 'both')
  )
}

#' Complete Academic 1940 Style
#'
#' Returns a list of ggplot2 layers combining a black-and-white palette, ggpattern fill styles, and the academic theme.
#'
#' @param n Number of categories to style
#' @return A list of ggplot2 components
#' @export
#' @examples
#' ggplot(df, aes(x, y, fill = group, pattern = group)) +
#'   geom_col_pattern() +
#'   suezalla_academic_style(n = 4)
suezalla_academic_style <- function(n = 6) {
  list(
    ggplot2::scale_fill_manual(values = suezalla_palette("academic", n = n)),
    ggpattern::scale_pattern_manual(values = suezalla_patterns(n)),
    theme_academic1940_pattern()
  )
}

#' Theme: Academic 1940 with Pattern Bars
#'
#' A vintage-style ggplot2 theme for academic-style bar plots.
#' Applies black-and-white fill colors, pattern styles via ggpattern, and vintage typography.
#' Uses the "Abhaya Libre" font (auto-loaded).
#'
#' @param n Number of discrete groups to assign patterns and fills
#' @return A list of ggplot2 layers (theme, scales, geom)
#' @export
#' @importFrom ggplot2 theme element_text element_blank element_line element_rect scale_fill_manual scale_pattern_manual
#' @importFrom ggpattern geom_col_pattern
#' @importFrom lemon coord_capped_cart
#' @importFrom ggpattern geom_col_pattern scale_pattern_manual
#' @examples
#' df <- aggregate(wt ~ cyl, data = mtcars, FUN = mean)
#' df$cyl <- factor(df$cyl)
#' ggplot(df, aes(x = cyl, y = wt, fill = cyl, pattern = cyl)) +
#'   theme_academic1940_pattern(n = 3)
theme_academic1940_pattern <- function(n = 6) {
  list(
    ggplot2::scale_fill_manual(values = suezalla_palette("academic", n = n)),
    ggpattern::scale_pattern_manual(values = suezalla_patterns(n)),
    ggpattern::geom_col_pattern(
      pattern_density = 0.4,
      pattern_spacing = 0.02,
      colour = "black"
    ),
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

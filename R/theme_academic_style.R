#' Theme: Academic 1940 with Patterns
#'
#' A vintage-style ggplot2 theme inspired by black-and-white academic plots.
#' Designed to work with ggpattern fills and the "academic" palette.
#' Uses the "Abhaya Libre" font if available.
#'
#' @param n Number of groups (used for assigning fill and pattern)
#' @param pattern_density Density of pattern (default = 0.4)
#' @param pattern_spacing Spacing between pattern elements (default = 0.02)
#' @param colour Outline colour of the bars (default = "black")
#' @param show.legend Whether to show legend (default = TRUE)
#' @param notch Whether to use notched box plot (default = FALSE)
#' @param notchwidth Width of the notch relative to the body (default = 0.5)
#' @param staplewidth Width of staples (default = 1)
#' @param varwidth Whether box width is proportional to sqrt(n) (default = FALSE)
#' @param fatten Multiplicative factor for middle point size (default = 2)
#' @param outline.type Outline type for geom (default = "both")
#' @param binwidth Bin width for histograms (default = NULL)
#' @param bins Number of bins (default = 30)
#' @param rule Polygon fill rule (default = "evenodd")
#' @param map Data frame for map geom (default = NULL)
#' @param draw_quantiles Quantiles to draw for violin plots (default = NULL)
#' @param trim Trim tails in violin plots (default = TRUE)
#' @param bounds Bounds for density estimation (default = c(-Inf, Inf))
#' @param scale Scale for violin width (default = "area")
#'
#' @return A ggplot2 theme object with ggpattern integration
#' @export
#' @importFrom ggplot2 theme element_text element_blank element_line element_rect scale_fill_manual
#' @importFrom ggpattern geom_col_pattern scale_pattern_manual
#' @importFrom lemon coord_capped_cart
#' @examples
#' df <- aggregate(wt ~ cyl, data = mtcars, FUN = mean)
#' df$cyl <- factor(df$cyl)
#' ggplot(df, aes(x = cyl, y = wt, fill = cyl, pattern = cyl)) +
#'   theme_academic1940_pattern(n = 3)
theme_academic1940_pattern <- function(
    n = 6,
    pattern_density = 0.4,
    pattern_spacing = 0.02,
    colour = "black",
    show.legend = TRUE,
    notch = FALSE,
    notchwidth = 0.5,
    staplewidth = 1,
    varwidth = FALSE,
    fatten = 2,
    outline.type = "both",
    binwidth = NULL,
    bins = 30,
    rule = "evenodd",
    map = NULL,
    draw_quantiles = NULL,
    trim = TRUE,
    bounds = c(-Inf, Inf),
    scale = "area"
) {
  list(
    ggplot2::scale_fill_manual(values = suezalla_palette("academic", n)),
    ggpattern::scale_pattern_manual(values = suezalla_patterns(n)),
    ggpattern::geom_col_pattern(
      pattern_density = pattern_density,
      pattern_spacing = pattern_spacing,
      colour = colour,
      show.legend = show.legend
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

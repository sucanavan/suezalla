#' Academic 1940 Pattern Theme (with default geom_bar_pattern)
#'
#' A vintage-style black-and-white theme for bar plots using ggpattern.
#' Automatically includes scale_fill_manual, scale_pattern_manual, and a default geom_bar_pattern layer.
#'
#' @param n Number of pattern levels (i.e., factor levels in fill/pattern)
#' @param pattern_spacing Spacing between pattern elements (default 0.03)
#' @param pattern_density Pattern density (default NULL = ggpattern default)
#' @param pattern_key_scale_factor Size of the pattern in legend (default 1)
#' @param colour Outline color (default "black")
#' @param show.legend Whether to show legend (default TRUE)
#'
#' @return A list of ggplot2 layers
#' @export
#' @importFrom ggplot2 theme element_text element_blank element_line element_rect scale_fill_manual aes
#' @importFrom lemon coord_capped_cart
#' @importFrom ggpattern geom_bar_pattern scale_pattern_manual
theme_academic1940_pattern <- function(n = 6,
                                       pattern_spacing = 0.03,
                                       pattern_density = NULL,
                                       pattern_key_scale_factor = 1,
                                       colour = "black",
                                       show.legend = TRUE) {
  bw_palette <- suezalla_palette("academic", n = n)
  pattern_values <- suezalla_patterns(n)

  # Base layer
  bar_layer <- ggpattern::geom_bar_pattern(
    stat = "identity",
    pattern_spacing = pattern_spacing,
    pattern_key_scale_factor = pattern_key_scale_factor,
    fill = "white",
    colour = colour,
    show.legend = show.legend
  )

  list(
    ggplot2::scale_fill_manual(values = bw_palette),
    ggpattern::scale_pattern_manual(values = pattern_values),
    bar_layer,
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

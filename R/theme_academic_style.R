#' Complete Academic 1940 Style for ggplot2
#'
#' Combines a black-and-white color palette, pattern fills, and a classic theme for vintage academic-style plots.
#' Intended for use with `ggpattern` geoms (e.g., `geom_col_pattern()`).
#'
#' @param n Number of discrete groups (for assigning colors/patterns)
#'
#' @return A list of ggplot2 layers: fill scale, pattern scale, and theme
#' @export
#' @examples
#' ggplot(data, aes(x, y, fill = group, pattern = group)) +
#'   geom_col_pattern() +
#'   suezalla_academic_style(n = 5)
suezalla_academic_style <- function(n = 6) {
  list(
    ggplot2::scale_fill_manual(values = suezalla_palette("academic", n = n)),
    ggpattern::scale_pattern_manual(values = suezalla_patterns(n)),
    theme_academic1940_pattern()
  )
}

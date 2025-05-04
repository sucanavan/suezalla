#' Suezalla Theme
#'
#' A clean, minimalistic ggplot2 theme. Works best with Roboto (see `suezalla_fonts()`).
#'
#' @param base_size Base font size
#' @param base_family Font family (default = "Roboto")
#' @return A ggplot2 theme
#' @export
theme_suezalla <- function(base_size = 12, base_family = "Roboto") {
  ggplot2::theme_minimal(base_size = base_size, base_family = base_family) +
    ggplot2::theme(
      plot.title = ggplot2::element_text(face = "bold", size = rel(1.3)),
      plot.subtitle = ggplot2::element_text(size = rel(1)),
      axis.title = ggplot2::element_text(size = rel(1)),
      axis.text = ggplot2::element_text(size = rel(0.9)),
      panel.grid.minor = ggplot2::element_blank(),
      panel.grid.major = ggplot2::element_line(size = 0.2, colour = "gray90"),
      plot.background = ggplot2::element_rect(fill = "white", color = NA),
      legend.position = "bottom"
    )
}

#' Suezalla Zombie Theme (XKCD-style)
#'
#' A playful zombie-style ggplot2 theme for point plots. Uses `xkcd::theme_xkcd()` if available,
#' otherwise defaults to `cowplot::theme_cowplot()`. Automatically includes `coord_capped_cart()`
#' for capped axes. Requires the XKCD font to be installed in your system.
#'
#' @param base_size Base font size
#' @param base_family Font family to use (default = "xkcd")
#'
#' @return A list containing a ggplot2 theme and coordinate system
#' @export
#' @importFrom ggplot2 element_text element_line element_rect theme
#' @importFrom cowplot theme_cowplot
#' @importFrom lemon coord_capped_cart
theme_zombie <- function(base_size = 14, base_family = "xkcd") {
  use_xkcd <- requireNamespace("xkcd", quietly = TRUE)

  base_theme <- if (use_xkcd) {
    xkcd::theme_xkcd()
  } else {
    message("xkcd package not found. Falling back to cowplot::theme_cowplot().")
    cowplot::theme_cowplot(font_family = base_family)
  }

  list(
    base_theme +
      ggplot2::theme(
        text = ggplot2::element_text(family = base_family),
        legend.position = "none",
        axis.line = ggplot2::element_line(size = 0.3),
        axis.title = ggplot2::element_text(color = "black", size = 12),
        axis.text = ggplot2::element_text(size = 9, color = "black"),
        panel.grid.major.x = ggplot2::element_line(color = "darkgrey", linetype = 3, size = 0.2),
        plot.title = ggplot2::element_text(color = "black", hjust = 0.5, face = "bold", size = 13),
        plot.background = ggplot2::element_rect(fill = "#FFFDF4", color = NA)
      ),
    lemon::coord_capped_cart(bottom = "both", left = "both")
  )
}



#' Theme: Academic 1940
#'
#' A vintage-style ggplot2 theme inspired by classic black-and-white academic plots.
#' Requires "Abhaya Libre" font (auto-loaded from Google Fonts).
#'
#' @return A ggplot2 theme object
#' @export
#' @importFrom ggplot2 theme element_text element_blank element_line element_rect
#' @importFrom lemon coord_capped_cart
theme_academic1940 <- function() {
  list(
    ggplot2::theme(
      axis.text = ggplot2::element_text(size = 9, color = "black"),
      plot.title = ggplot2::element_blank(),
      legend.position = "none",
      panel.grid.major = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      axis.ticks = ggplot2::element_line(color = "black", size = 0.3),
      axis.line = ggplot2::element_line(color = "black", size = 0.3),
      text = ggplot2::element_text(family = "abhaya"),
      panel.background = ggplot2::element_rect(fill = "white", color = NA),
      plot.background = ggplot2::element_rect(fill = "white", color = NA)
    ),
    lemon::coord_capped_cart(bottom = 'both', left = 'both')
  )
}

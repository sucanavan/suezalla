#' Magazine Theme
#'
#' A clean, minimalistic theme inspired by editorial layouts.
#' All text in black, no background grids.
#'
#' @param base_size Base font size
#' @param font Character. Font family to use. Options: "Roboto", "latinmodern", "abhaya", "CMU Serif"
#' @return A ggplot2 theme
#' @export
theme_magazine <- function(base_size = 12,
                           font = c("Roboto", "latinmodern", "abhaya", "CMU Serif")) {
  font <- match.arg(font)

  ggplot2::theme_minimal(base_size = base_size, base_family = font) +
    ggplot2::theme(
      plot.title = ggplot2::element_text(hjust = 0.5, size = rel(1.1), color = "black"),
      plot.subtitle = ggplot2::element_text(size = rel(1), color = "black"),
      axis.title = ggplot2::element_text(size = rel(1), color = "black"),
      axis.text = ggplot2::element_text(size = rel(0.9), color = "black"),
      panel.grid.minor = ggplot2::element_blank(),
      panel.grid.major = ggplot2::element_blank(),
      axis.line = ggplot2::element_line(color = "black", size = 0.3),
      plot.background = ggplot2::element_rect(fill = "white", color = NA),
      legend.position = "bottom",
      legend.text = ggplot2::element_text(color = "black"),
      legend.title = ggplot2::element_text(size = 9)
    )
}



#' Academic 1940 Theme
#'
#' A vintage-style theme inspired by mid-century academic plots.
#'
#' @param font Font family: one of "latinmodern", "abhaya", "CMU Serif", "Roboto". Default is "abhaya".
#' @return A list: theme and coord system
#' @export
theme_academic1940 <- function(font = c("abhaya", "latinmodern", "CMU Serif", "Roboto")) {
  font <- match.arg(font)

  list(
    ggplot2::theme(
      axis.text = ggplot2::element_text(size = 9, color = "black"),
      panel.grid.major = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      axis.ticks = ggplot2::element_line(color = "black", size = 0.3),
      axis.line = ggplot2::element_line(color = "black", size = 0.3),
      text = ggplot2::element_text(family = font),
      legend.position = "right",
      legend.text = ggplot2::element_text(size = 8),
      legend.title = ggplot2::element_text(size = 9),
      plot.title = ggplot2::element_text(hjust = 0.5, size = 12),
      panel.background = ggplot2::element_rect(fill = "white", color = NA),
      plot.background = ggplot2::element_rect(fill = "white", color = NA)
    ),
    lemon::coord_capped_cart(bottom = 'both', left = 'both')
  )
}
#' LaTeX-Style Academic Plot Theme
#'
#' Clean black-and-white style with optional gridlines and font control.
#'
#' @param gridlines Logical. If TRUE (default), show light dashed gridlines.
#' @param axes Character. One of "all", "both", "x", "y", or "none".
#' @param font Font family: one of "latinmodern", "abhaya", "CMU Serif", "Roboto". Default is "latinmodern".
#'
#' @return A ggplot2 theme
#' @export
theme_latex <- function(gridlines = TRUE,
                        axes = "all",
                        font = c("latinmodern", "abhaya", "CMU Serif", "Roboto")) {

  axes <- match.arg(axes, choices = c("all", "both", "x", "y", "none"))
  font <- match.arg(font)

  grid_line <- if (gridlines) ggplot2::element_line(color = "grey80", linetype = "dashed", size = 0.1) else ggplot2::element_blank()
  show_box <- axes %in% c("all", "both")
  panel_border <- if (show_box) ggplot2::element_rect(color = "black", size = 0.3, fill = NA) else ggplot2::element_blank()
  axis_line_x <- if (axes == "x") ggplot2::element_line(color = "black", size = 0.3) else ggplot2::element_blank()
  axis_line_y <- if (axes == "y") ggplot2::element_line(color = "black", size = 0.3) else ggplot2::element_blank()

  ggplot2::theme(
    axis.text = ggplot2::element_text(size = 9, color = "black"),
    panel.grid.major = grid_line,
    panel.grid.minor = ggplot2::element_blank(),
    axis.ticks = ggplot2::element_line(color = "black", size = 0.3),
    axis.line.x = axis_line_x,
    axis.line.y = axis_line_y,
    panel.border = panel_border,
    text = ggplot2::element_text(family = font),
    legend.position = "right",
    legend.text = ggplot2::element_text(size = 8),
    legend.title = ggplot2::element_text(size = 9),
    plot.title = ggplot2::element_text(hjust = 0.5, size = 12),
    panel.background = ggplot2::element_rect(fill = "white", color = NA),
    plot.background = ggplot2::element_rect(fill = "white", color = NA),
    legend.key = ggplot2::element_blank()
  )
}

#' Suezalla Zombie Theme (XKCD-style)
#'
#' A playful theme for point plots. Uses `xkcd::theme_xkcd()` if available,
#' otherwise falls back to `cowplot::theme_cowplot()` with custom font.
#'
#' @param base_size Base font size
#' @param font Font family. Options: "xkcd", "latinmodern", "abhaya", "CMU Serif", "Roboto"
#' @return A list: theme and coordinate system
#' @export
theme_zombie <- function(base_size = 14,
                         font = c("xkcd", "latinmodern", "abhaya", "CMU Serif", "Roboto")) {
  font <- match.arg(font)
  use_xkcd <- (font == "xkcd") && requireNamespace("xkcd", quietly = TRUE)

  base_theme <- if (use_xkcd) {
    xkcd::theme_xkcd()
  } else {
    if (font == "xkcd") message("xkcd package not found. Falling back to cowplot with specified font.")
    cowplot::theme_cowplot(font_family = font)
  }

  list(
    base_theme +
      ggplot2::theme(
        text = ggplot2::element_text(family = font),
        axis.line = ggplot2::element_line(size = 0.3),
        axis.title = ggplot2::element_text(color = "black", size = 12),
        axis.text = ggplot2::element_text(size = 9, color = "black"),
        panel.grid.major.x = ggplot2::element_line(color = "darkgrey", linetype = 3, size = 0.2),
        plot.title = ggplot2::element_text(color = "black", hjust = 0.5, face = "bold", size = 13),
        plot.background = ggplot2::element_rect(fill = "#FFFDF4", color = NA),
        legend.background = ggplot2::element_blank(),
        legend.key = ggplot2::element_blank()
      ),
    lemon::coord_capped_cart(bottom = "both", left = "both")
  )
}

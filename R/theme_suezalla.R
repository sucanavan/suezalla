#' Magazine Theme
#'
#' A clean, minimalistic theme inspired by editorial layouts. All text in black, no background grids.
#'
#' @param base_size Base font size
#' @param base_family Font family (default = "Roboto")
#' @return A ggplot2 theme
#' @export
theme_magazine <- function(base_size = 12, base_family = "Roboto") {
  ggplot2::theme_minimal(base_size = base_size, base_family = base_family) +
    ggplot2::theme(
      plot.title = ggplot2::element_text(face = "bold", size = rel(1.3), color = "black"),
      plot.subtitle = ggplot2::element_text(size = rel(1), color = "black"),
      axis.title = ggplot2::element_text(size = rel(1), color = "black"),
      axis.text = ggplot2::element_text(size = rel(0.9), color = "black"),
      panel.grid.minor = ggplot2::element_blank(),
      panel.grid.major = ggplot2::element_blank(),
      axis.line = ggplot2::element_line(color = "black", size = 0.3),
      plot.background = ggplot2::element_rect(fill = "white", color = NA),
      legend.position = "bottom",
      legend.text = ggplot2::element_text(color = "black"),
      legend.title = ggplot2::element_text(color = "black")
    )
}

#' Suezalla Zombie Theme (XKCD-style)
#'
#' A playful zombie-style ggplot2 theme for point plots. Uses `xkcd::theme_xkcd()` if available,
#' otherwise falls back to `cowplot::theme_cowplot()` with custom font.
#'
#' @param base_size Base font size
#' @param base_family Font family to use (default = "xkcd")
#' @return A list: ggplot2 theme and coordinate system
#' @export
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
#' A vintage-style theme inspired by black-and-white academic plots.
#'
#' @param base_family Font to use (default = "abhaya")
#' @return A list: theme and coordinate system
#' @export
theme_academic1940 <- function(base_family = "abhaya") {
  list(
    ggplot2::theme(
      axis.text = ggplot2::element_text(size = 9, color = "black"),
      panel.grid.major = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      axis.ticks = ggplot2::element_line(color = "black", size = 0.3),
      axis.line = ggplot2::element_line(color = "black", size = 0.3),
      text = ggplot2::element_text(family = base_family),
      legend.position = "right",
      legend.text = ggplot2::element_text(size = 8),
      legend.title = ggplot2::element_text(size = 9, face = "bold"),
      panel.background = ggplot2::element_rect(fill = "white", color = NA),
      plot.background = ggplot2::element_rect(fill = "white", color = NA)
    ),
    lemon::coord_capped_cart(bottom = 'both', left = 'both')
  )
}



#' Theme: LaTeX-Style Academic Plot
#'
#' A vintage-style ggplot2 theme with clean black-and-white styling, optional dashed gridlines,
#' and selectable fonts for LaTeX-like output. Supports full box axis or selective axis lines.
#'
#' @param gridlines Logical. If TRUE (default), show light dashed major gridlines.
#' @param axes Character. One of "all", "both", "x", "y", or "none" — controls axis line visibility.
#' @param font Character. Choose a font: "abhaya" (default), "CMU Serif", or "Latin Modern Roman".
#'
#' @return A ggplot2 theme object
#' @export
theme_latex <- function(gridlines = TRUE,
                        axes = "all",
                        font = c("abhaya", "CMU Serif", "Latin Modern Roman")) {

  axes <- match.arg(axes, choices = c("all", "both", "x", "y", "none"))
  font <- match.arg(font)

  grid_line <- if (gridlines) ggplot2::element_line(color = "grey80", linetype = "dashed", size = 0.2) else ggplot2::element_blank()

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
    legend.title = ggplot2::element_text(size = 9, face = "bold"),
    panel.background = ggplot2::element_rect(fill = "white", color = NA),
    plot.background = ggplot2::element_rect(fill = "white", color = NA),
    legend.key = ggplot2::element_blank()
  )
}

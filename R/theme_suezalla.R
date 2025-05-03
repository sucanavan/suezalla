#' Suezalla custom ggplot2 theme
#'
#' A clean, minimalistic ggplot2 theme.
#' @export
theme_suezalla <- function(base_size = 12, base_family = "Roboto") {
  ggplot2::theme_minimal(base_size = base_size, base_family = base_family) +
    ggplot2::theme(
      plot.title = element_text(face = "bold", size = rel(1.3)),
      plot.subtitle = element_text(size = rel(1)),
      axis.title = element_text(size = rel(1)),
      axis.text = element_text(size = rel(0.9)),
      panel.grid.minor = element_blank(),
      panel.grid.major = element_line(size = 0.2, colour = "gray90"),
      plot.background = element_rect(fill = "#FFFDF4", color = NA),
      legend.position = "bottom"
    )
}

#' Custom Suezalla Colour Palette
#'
#' @export
suezalla_cols <- function() {
  c("#386641", "#6A994E", "#A7C957", "#F2E8CF", "#BC4749")
}

#' Suezalla colour scale for ggplot
#'
#' @export
scale_colour_suezalla <- function(...) {
  ggplot2::scale_colour_manual(values = suezalla_cols(), ...)
}

#' Suezalla fill scale for ggplot
#'
#' @export
scale_fill_suezalla <- function(...) {
  ggplot2::scale_fill_manual(values = suezalla_cols(), ...)
}

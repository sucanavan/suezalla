#-------------------------------
# R/theme_suezalla.R
#-------------------------------

#' Suezalla custom ggplot2 theme

#' Load Roboto font for suezalla theme
#'
#' Loads the Roboto Google font and enables `showtext` rendering for plots.
#' Must be called before plotting for the Roboto font to apply.
#'
#' @export
suezalla_fonts <- function() {
  if (!requireNamespace("sysfonts", quietly = TRUE)) stop("Please install the 'sysfonts' package.")
  if (!requireNamespace("showtext", quietly = TRUE)) stop("Please install the 'showtext' package.")

  sysfonts::font_add_google("Roboto", "Roboto")
  showtext::showtext_auto()
}


#' A clean, minimalistic ggplot2 theme designed to work well with Roboto font.
#' Note: Use `suezalla_fonts()` before plotting to load and activate the Roboto font.
#'
#' @param base_size Base font size
#' @param base_family Font family, default is "Roboto"
#'
#' @return A ggplot2 theme object
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
      plot.background = element_rect(fill = "white", color = NA),  # ← now pure white
      legend.position = "bottom"
    )
}

#' Suezalla Zombie Theme
#'
#' A playful zombie-style ggplot2 theme for point plots. Requires the XKCD font installed.
#'
#' @return A ggplot2 theme object
#' @export
theme_zombie <- function(base_size = 12, base_family = "xkcd") {
  ggplot2::theme_cowplot(font_family = base_family) +
    ggplot2::theme(
      text = ggplot2::element_text(family = base_family),
      legend.position = "none",
      axis.line = ggplot2::element_line(size = 0.3),
      axis.title = ggplot2::element_text(color = "black", size = 12),
      axis.text = ggplot2::element_text(size = 9, color = "black"),
      panel.grid.major.x = ggplot2::element_line(color = "darkgrey", linetype = 3, size = 0.2),
      plot.title = ggplot2::element_text(color = "black", hjust = 0.5, family = base_family, face = "bold", size = 13),
      plot.background = ggplot2::element_rect(fill = "#FFFDF4", color = NA)
    )
}



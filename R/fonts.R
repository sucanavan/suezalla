#' Register Roboto font for suezalla theme
#'
#' Downloads and registers Roboto from Google Fonts using sysfonts.
#' You must call this before using `theme_suezalla()` if you want custom font rendering.
#'
#' @export
suezalla_fonts <- function() {
  if (!requireNamespace("sysfonts", quietly = TRUE) || !requireNamespace("showtext", quietly = TRUE)) {
    warning("Please install the 'sysfonts' and 'showtext' packages.")
    return(invisible(FALSE))
  }

  sysfonts::font_add_google("Roboto", "Roboto")
  showtext::showtext_auto()

  if (!"Roboto" %in% sysfonts::font_families()) {
    warning("Roboto font could not be loaded.")
    return(invisible(FALSE))
  }

  message("Roboto font loaded successfully.")
  invisible(TRUE)
}


#' Register xkcd font for zombie theme
#'
#' You must manually install the xkcd font (e.g., https://github.com/ipython/xkcd-font/raw/master/xkcd-script.ttf)
#' and ensure it's available in your system fonts folder before calling this.
#'
#' @export
suezalla_fonts_zombie <- function() {
  if (!requireNamespace("sysfonts", quietly = TRUE) || !requireNamespace("showtext", quietly = TRUE)) {
    warning("Install 'sysfonts' and 'showtext' packages to enable custom fonts.")
    return(invisible(FALSE))
  }

  sysfonts::font_add(family = "xkcd", regular = "xkcd.ttf")
  showtext::showtext_auto()

  if (!"xkcd" %in% sysfonts::font_families()) {
    warning("The xkcd font could not be loaded. Did you install xkcd.ttf?")
    return(invisible(FALSE))
  }

  message("xkcd font loaded successfully.")
  invisible(TRUE)
}

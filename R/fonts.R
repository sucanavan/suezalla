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


#' Optional helper to manually register the XKCD font
#'
#' Downloads and installs the XKCD font and registers it for use with ggplot2.
#'
#' @export
suezalla_fonts_zombie <- function() {
  if (!requireNamespace("sysfonts", quietly = TRUE) || !requireNamespace("showtext", quietly = TRUE)) {
    warning("Please install the 'sysfonts' and 'showtext' packages.")
    return(invisible(FALSE))
  }

  font_url <- "http://simonsoftware.se/other/xkcd.ttf"
  font_file <- file.path(tempdir(), "xkcd.ttf")

  tryCatch({
    utils::download.file(font_url, destfile = font_file, mode = "wb")
    sysfonts::font_add(family = "xkcd", regular = font_file)
    showtext::showtext_auto()
    message("✅ XKCD font loaded for zombie theme.")
    invisible(TRUE)
  }, error = function(e) {
    warning("⚠ Failed to download or register XKCD font: ", e$message)
    invisible(FALSE)
  })
}

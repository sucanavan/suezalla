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


#' Install and register XKCD font
#'
#' Downloads and installs the XKCD font and registers it for use in ggplot2 themes.
#' This works across macOS, Windows, and Linux.
#'
#' @export
suezalla_fonts_zombie <- function() {
  if (!requireNamespace("extrafont", quietly = TRUE)) stop("Please install the 'extrafont' package.")

  # Download XKCD font to temp location
  font_url <- "https://github.com/ipython/xkcd-font/raw/master/xkcd-script.ttf"
  font_file <- file.path(tempdir(), "xkcd.ttf")
  download.file(font_url, destfile = font_file, mode = "wb")

  # Import it using extrafont
  extrafont::font_import(paths = dirname(font_file), pattern = "[Xx]kcd", prompt = FALSE)
  extrafont::loadfonts(device = if (.Platform$OS.type == "windows") "win" else "pdf")

  if (!"xkcd" %in% extrafont::fonts()) {
    warning("XKCD font import failed. Try restarting R.")
    return(invisible(FALSE))
  }

  message("✅ XKCD font installed and registered.")
  invisible(TRUE)
}

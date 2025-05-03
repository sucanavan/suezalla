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


#' Install and register XKCD font (manual fallback)
#'
#' Downloads the XKCD font and registers it for use with theme_zombie().
#' Only needed if system install fails or you're on Windows/macOS.
#'
#' @export
install_xkcd_font <- function() {
  font_url <- "https://suezalla-fonts.s3.eu-west-1.amazonaws.com/xkcd.ttf"
  font_file <- file.path(tempdir(), "xkcd.ttf")

  tryCatch({
    download.file(font_url, destfile = font_file, mode = "wb")
    sysfonts::font_add(family = "xkcd", regular = font_file)
    showtext::showtext_auto()
    message("✅ XKCD font downloaded and loaded from temp directory.")
  }, error = function(e) {
    warning("❌ Could not download XKCD font: ", e$message)
  })

  invisible(TRUE)
}

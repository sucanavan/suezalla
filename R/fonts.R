#' Register fonts for suezalla themes
#'
#' Installs and registers required fonts, including Latin Modern Roman, from local files.
#'
#' @export
suezalla_fonts <- function() {
  if (!requireNamespace("sysfonts", quietly = TRUE) || !requireNamespace("showtext", quietly = TRUE)) {
    warning("Please install the 'sysfonts' and 'showtext' packages.")
    return(invisible(FALSE))
  }

  showtext::showtext_auto()

  font_path <- system.file("fonts", "lmroman", package = "suezalla")

  # Add Latin Modern Roman from local .otf
  sysfonts::font_add(family = "latinmodern",
                     regular = file.path(font_path, "lmroman10-regular.otf"),
                     bold    = file.path(font_path, "lmroman10-bold.otf"),
                     italic  = file.path(font_path, "lmroman10-italic.otf"),
                     bolditalic = file.path(font_path, "lmroman10-bolditalic.otf"))

  # Also add Roboto and Abhaya Libre from Google Fonts
  sysfonts::font_add_google("Roboto", "Roboto")
  sysfonts::font_add_google("Abhaya Libre", "abhaya")

  invisible(TRUE)
}

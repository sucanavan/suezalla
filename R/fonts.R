#' Register fonts for suezalla themes
#'
#' Loads Roboto and Abhaya Libre from Google Fonts and local LaTeX-like fonts.
#' You must call this before plotting if you want full font rendering.
#'
#' @export
suezalla_fonts <- function() {
  if (!requireNamespace("sysfonts", quietly = TRUE) || !requireNamespace("showtext", quietly = TRUE)) {
    warning("Please install the 'sysfonts' and 'showtext' packages.")
    return(invisible(FALSE))
  }

  showtext::showtext_auto()

  # Load fonts from Google
  try(sysfonts::font_add_google("Roboto", "Roboto"), silent = TRUE)
  try(sysfonts::font_add_google("Abhaya Libre", "abhaya"), silent = TRUE)

  # Load local fonts from inst/fonts
  font_dir <- system.file("fonts", package = "suezalla")
  try(sysfonts::font_add("latinmodern", regular = file.path(font_dir, "lmroman10-regular.otf")), silent = TRUE)
  try(sysfonts::font_add("cmuserif", regular = file.path(font_dir, "cmuserif-regular.otf")), silent = TRUE)

  loaded <- sysfonts::font_families()
  message("✅ Fonts loaded: ", paste(loaded, collapse = ", "))

  invisible(TRUE)
}

.onLoad <- function(libname, pkgname) {
  if (requireNamespace("sysfonts", quietly = TRUE) &&
      requireNamespace("showtext", quietly = TRUE)) {
    sysfonts::font_add_google("Roboto", "Roboto")
    showtext::showtext_auto()
  }
}

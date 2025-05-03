.onAttach <- function(libname, pkgname) {
  if (requireNamespace("sysfonts", quietly = TRUE) &&
      requireNamespace("showtext", quietly = TRUE)) {
    sysfonts::font_add_google("Roboto", "Roboto")
    showtext::showtext_auto()
    packageStartupMessage("Roboto font loaded for suezalla theme.")
  } else {
    packageStartupMessage("Install 'sysfonts' and 'showtext' to enable custom fonts.")
  }
}

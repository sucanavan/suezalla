.onAttach <- function(libname, pkgname) {
  # Load Roboto and optionally XKCD fonts
  if (requireNamespace("sysfonts", quietly = TRUE) &&
      requireNamespace("showtext", quietly = TRUE)) {

    # Register Roboto from Google Fonts
    sysfonts::font_add_google("Roboto", "Roboto")

    # Define common locations for XKCD font
    possible_paths <- c(
      "xkcd.ttf",
      file.path("~", "Library", "Fonts", "xkcd.ttf"),         # macOS
      file.path("~", ".fonts", "xkcd.ttf"),                   # Linux
      file.path(Sys.getenv("WINDIR"), "Fonts", "xkcd.ttf")    # Windows
    )
    expanded_paths <- path.expand(possible_paths)
    xkcd_exists <- file.exists(expanded_paths)

    if (any(xkcd_exists)) {
      font_path <- expanded_paths[which(xkcd_exists)[1]]
      sysfonts::font_add(family = "xkcd", regular = font_path)
      showtext::showtext_auto()
      packageStartupMessage("✅ Fonts loaded: Roboto and XKCD")
    } else {
      showtext::showtext_auto()
      packageStartupMessage("⚠ Roboto loaded. XKCD font not found. Please install 'xkcd.ttf' in your system Fonts folder.")
    }

  } else {
    packageStartupMessage("⚠ Please install the 'sysfonts' and 'showtext' packages to enable custom fonts.")
  }
}

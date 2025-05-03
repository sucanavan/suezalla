.onAttach <- function(libname, pkgname) {
  # Load Roboto from Google Fonts
  if (requireNamespace("sysfonts", quietly = TRUE) &&
      requireNamespace("showtext", quietly = TRUE)) {

    sysfonts::font_add_google("Roboto", "Roboto")

    # Try loading xkcd.ttf from user/system font directories
    possible_paths <- c(
      "xkcd.ttf",
      file.path("~", "Library", "Fonts", "xkcd.ttf"),         # macOS
      file.path("~", ".fonts", "xkcd.ttf"),                   # Linux
      file.path(Sys.getenv("WINDIR"), "Fonts", "xkcd.ttf")    # Windows
    )
    xkcd_found <- any(file.exists(path.expand(possible_paths)))

    if (xkcd_found) {
      font_path <- path.expand(possible_paths[file.exists(path.expand(possible_paths))][1])
      sysfonts::font_add(family = "xkcd", regular = font_path)
      showtext::showtext_auto()
      packageStartupMessage("✅ Fonts loaded: Roboto and XKCD")
    } else {
      showtext::showtext_auto()
      packageStartupMessage("⚠ Roboto loaded. XKCD font not found. Please install 'xkcd.ttf' in your Fonts folder.")
    }

  } else {
    packageStartupMessage("⚠ Please install 'sysfonts' and 'showtext' to enable custom fonts.")
  }
}

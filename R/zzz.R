# R/zzz.R

.onAttach <- function(libname, pkgname) {
  if (requireNamespace("sysfonts", quietly = TRUE) &&
      requireNamespace("showtext", quietly = TRUE)) {

    # Load Roboto from Google
    try({
      sysfonts::font_add_google("Roboto", "Roboto")
    }, silent = TRUE)

    # Attempt to load XKCD if available in system or working dir
    xkcd_paths <- c(
      file.path("~", "Library", "Fonts", "xkcd.ttf"),  # macOS
      file.path("~", ".fonts", "xkcd.ttf"),            # Linux
      file.path(Sys.getenv("WINDIR"), "Fonts", "xkcd.ttf"), # Windows
      "xkcd.ttf"                                       # fallback: working directory
    )

    xkcd_exists <- file.exists(xkcd_paths)

    if (any(xkcd_exists)) {
      try({
        sysfonts::font_add("xkcd", regular = xkcd_paths[which(xkcd_exists)[1]])
      }, silent = TRUE)
    }

    # Activate showtext rendering
    showtext::showtext_auto()

    # Feedback
    packageStartupMessage("✔ Fonts loaded: Roboto")
    if (any(xkcd_exists)) {
      packageStartupMessage("✔ XKCD font registered (for theme_zombie)")
    } else {
      packageStartupMessage("⚠ XKCD font not found. Please install xkcd.ttf to use theme_zombie.")
    }

  } else {
    packageStartupMessage("⚠ Install 'sysfonts' and 'showtext' to enable custom fonts.")
  }
}

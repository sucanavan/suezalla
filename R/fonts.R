#' Register fonts for suezalla themes
#'
#' Downloads and registers fonts used across suezalla themes:
#' - Roboto (sans-serif)
#' - Abhaya Libre (serif)
#' - Latin Modern Roman (LaTeX-style serif)
#' - CMU Serif (Computer Modern alternative)
#'
#' Must be called once per R session before plotting if you want custom font rendering.
#'
#' @export
suezalla_fonts <- function() {
  if (!requireNamespace("sysfonts", quietly = TRUE) || !requireNamespace("showtext", quietly = TRUE)) {
    warning("Please install the 'sysfonts' and 'showtext' packages.")
    return(invisible(FALSE))
  }

  # Enable font rendering
  showtext::showtext_auto()

  # Define fonts to load: name = Google Fonts name, alias = internal name
  fonts_to_load <- list(
    "Roboto"               = "Roboto",
    "Abhaya Libre"         = "abhaya",
    "Latin Modern Roman"   = "latinmodern",
    "CMU Serif"            = "cmuserif"
  )

  for (font in names(fonts_to_load)) {
    alias <- fonts_to_load[[font]]
    tryCatch({
      sysfonts::font_add_google(name = font, family = alias)
    }, error = function(e) {
      warning(sprintf("⚠ Could not load font '%s': %s", font, e$message))
    })
  }

  # Check success
  loaded <- sysfonts::font_families()
  missing_fonts <- setdiff(unname(fonts_to_load), loaded)
  if (length(missing_fonts) > 0) {
    warning("⚠ Some fonts were not loaded: ", paste(missing_fonts, collapse = ", "))
  } else {
    message("✅ Fonts loaded: ", paste(unname(fonts_to_load), collapse = ", "))
  }

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

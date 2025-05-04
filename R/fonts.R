#' Register fonts for suezalla themes
#'
#' Downloads and registers fonts used across suezalla themes:
#' - Roboto (sans-serif, from Google Fonts)
#' - Abhaya Libre (serif, from Google Fonts)
#' - Latin Modern Roman (LaTeX-style serif, local OTF)
#' - CMU Serif (Computer Modern-style serif, local OTF)
#'
#' Must be called once per R session before plotting.
#'
#' @export
suezalla_fonts <- function() {
  if (!requireNamespace("sysfonts", quietly = TRUE) || !requireNamespace("showtext", quietly = TRUE)) {
    warning("Please install the 'sysfonts' and 'showtext' packages.")
    return(invisible(FALSE))
  }

  # Enable showtext rendering
  showtext::showtext_auto()

  # Try to register Roboto (Google Fonts)
  tryCatch({
    sysfonts::font_add_google("Roboto", "Roboto")
  }, error = function(e) {
    warning("⚠ Could not load Roboto from Google Fonts: ", e$message)
  })

  # Add Abhaya Libre (Google Fonts)
  tryCatch({
    sysfonts::font_add_google("Abhaya Libre", "abhaya")
  }, error = function(e) {
    warning("⚠ Could not load Abhaya Libre from Google Fonts: ", e$message)
  })

  # Load local fonts from inst/fonts
  font_dir <- system.file("fonts", package = "suezalla")

  tryCatch({
    sysfonts::font_add("latinmodern", file.path(font_dir, "lmroman10-regular.otf"))
  }, error = function(e) {
    warning("⚠ Could not load Latin Modern Roman: ", e$message)
  })

  tryCatch({
    sysfonts::font_add("CMU Serif", file.path(font_dir, "lmromandemi10-regular.otf"))
  }, error = function(e) {
    warning("⚠ Could not load CMU Serif: ", e$message)
  })

  # Final check
  loaded_fonts <- sysfonts::font_families()
  expected <- c("Roboto", "abhaya", "latinmodern", "CMU Serif")
  missing <- setdiff(expected, loaded_fonts)

  if (length(missing) > 0) {
    warning("⚠ These fonts failed to load: ", paste(missing, collapse = ", "))
  } else {
    message("✅ Fonts loaded: ", paste(expected, collapse = ", "))
  }

  invisible(TRUE)
}

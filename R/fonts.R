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

  # Font directory inside installed package
  font_dir <- system.file("fonts", package = "suezalla")

  # Check if the font directory was found
  if (font_dir == "") {
    warning("⚠ Could not find 'fonts' folder in installed suezalla package.")
    return(invisible(FALSE))
  }

  # Attempt to add fonts
  tryCatch({
    sysfonts::font_add_google("Roboto", "Roboto")
  }, error = function(e) {
    warning("⚠ Could not load Roboto from Google Fonts: ", e$message)
  })

  tryCatch({
    sysfonts::font_add_google("Abhaya Libre", "abhaya")
  }, error = function(e) {
    warning("⚠ Could not load Abhaya Libre from Google Fonts: ", e$message)
  })

  tryCatch({
    lm_path <- file.path(font_dir, "lmroman10-regular.otf")
    if (file.exists(lm_path)) {
      sysfonts::font_add("latinmodern", lm_path)
    } else {
      warning("⚠ latinmodern font file not found at: ", lm_path)
    }
  }, error = function(e) {
    warning("⚠ Could not register Latin Modern Roman: ", e$message)
  })

  tryCatch({
    cmu_path <- file.path(font_dir, "lmromandemi10-regular.otf")
    if (file.exists(cmu_path)) {
      sysfonts::font_add("CMU Serif", cmu_path)
    } else {
      warning("⚠ CMU Serif font file not found at: ", cmu_path)
    }
  }, error = function(e) {
    warning("⚠ Could not register CMU Serif: ", e$message)
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

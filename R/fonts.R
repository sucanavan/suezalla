#' Register Roboto font for suezalla theme
#'
#' Downloads and registers Roboto from Google Fonts using sysfonts.
#' You must call this before using `theme_suezalla()` if you want custom font rendering.
#'
#' @export
suezalla_fonts <- function() {
  if (!requireNamespace("sysfonts", quietly = TRUE) || !requireNamespace("showtext", quietly = TRUE)) {
    warning("Please install the 'sysfonts' and 'showtext' packages.")
    return(invisible(FALSE))
  }

  sysfonts::font_add_google("Roboto", "Roboto")
  showtext::showtext_auto()

  if (!"Roboto" %in% sysfonts::font_families()) {
    warning("Roboto font could not be loaded.")
    return(invisible(FALSE))
  }

  message("Roboto font loaded successfully.")
  invisible(TRUE)
}


#' Install xkcd font on macOS, Windows, or Linux
#'
#' Downloads and installs the xkcd font to your system font folder.
#' Required for using `theme_zombie()`.
#'
#' @export
install_xkcd_font <- function() {
  font_url <- "https://github.com/ipython/xkcd-font/raw/master/xkcd-script.ttf"
  font_file <- "xkcd.ttf"

  # Download font
  message("Downloading xkcd font...")
  tryCatch({
    download.file(font_url, destfile = font_file, mode = "wb")
  }, error = function(e) {
    stop("Failed to download font: ", e$message)
  })

  # Determine system font folder
  sys_font_dir <- switch(Sys.info()[["sysname"]],
                         "Darwin"  = "~/Library/Fonts",
                         "Windows" = Sys.getenv("WINDIR", "C:/Windows"),  # Usually already correct
                         "Linux"   = "~/.fonts",
                         stop("Unsupported OS"))

  full_path <- file.path(path.expand(sys_font_dir), font_file)

  # Create font folder if needed
  if (!dir.exists(dirname(full_path))) {
    dir.create(dirname(full_path), recursive = TRUE, showWarnings = FALSE)
  }

  # Copy font to system folder
  file.copy(font_file, full_path, overwrite = TRUE)
  file.remove(font_file)

  message("✅ xkcd font installed to: ", full_path)
  message("You may need to restart R or your computer for the font to appear.")
}

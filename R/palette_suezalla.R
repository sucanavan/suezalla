#' Suezalla Color Palette Generator
#'
#' Generates a palette of any number of colors from a named preset scheme.
#'
#' @param name Name of the color scheme (e.g., "polaroid", "vibrant", etc.)
#' @param n Number of colors to return
#' @param type Type of palette: "discrete" or "continuous"
#'
#' @return A character vector of hex color codes
#' @export
suezalla_palette <- function(name = "polaroid", n = NULL, type = c("discrete", "continuous")) {
  type <- match.arg(type)

  palettes <- list(
    polaroid  = c("#45AAB4", "#038DB2", "#206491", "#F9637C", "#FE7A66", "#FBB45C"),
    vibrant   = c("#FFC567", "#FD5A46", "#00995E", "#FB7DA8", "#552CB7", "#058CD7"),
    jam       = c("#FBC9BE", "#DB7B65", "#ECB865", "#695356", "#255F63"),
    corporate = c("#23C2A2", "#EC3431", "#FBDE21", "#138ABD", "#9BBAFA"),
    lively1   = c("#ED5565", "#FFCE54", "#48CFAD", "#5D9CEC", "#FC6E51", "#A0D468", "#4FC1E9", "#AC92EC"),
    lively2   = c("#DA4453", "#F6BB42", "#37BC98", "#4A89DC", "#E9573F", "#8CC152", "#3BAFDA", "#967ADC"),
    retro     = c("#E7363C", "#F56438", "#FCAB20", "#59AC99", "#3E446E"),
    autumn    = c("#388388", "#4ABFBD", "#8AB17D", "#E9C46A", "#F4A261", "#E76F51"),
    zombie    = c("#B3B3B3", "#F56438", "#59AC99"),
    academic  = c("#000000", "#1A1A1A", "#666666", "#B3B3B3", "#FFFFFF"),
    npg       = c("#E64B35", "#4DBBD5", "#00A087", "#3C5488", "#F39B7F", "#8491B4", "#91D1C2", "#DC0000", "#7E6148", "#B09C85")
  )

  if (!(name %in% names(palettes))) {
    stop("Palette not found. Available options are: ", paste(names(palettes), collapse = ", "))
  }

  pal <- palettes[[name]]

  if (is.null(n)) {
    n <- length(pal)
  }

  if (type == "discrete") {
    if (n > length(pal)) {
      stop("Number of requested colors exceeds palette length")
    }
    return(pal[1:n])
  } else {
    return(grDevices::colorRampPalette(pal)(n))
  }
}

#' Suezalla Pattern Fill Generator
#'
#' Returns a repeating vector of ggpattern fill types (e.g., "stripe", "crosshatch") for black-and-white themes.
#'
#' @param n Number of pattern values to return. If NULL, returns all available.
#'
#' @return A character vector of pattern names
#' @export
suezalla_patterns <- function(n = NULL) {
  patterns <- c("stripe", "crosshatch", "circle", "none", "grid", "polygon_tiling")
  if (is.null(n)) return(patterns)
  return(rep_len(patterns, n))
}

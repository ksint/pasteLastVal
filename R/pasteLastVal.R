# Paste the .Last.value as a comment in the next line of code
# as a comment in the active Rstudio editor
# by Kyaw Sint (Joe), Thanks to the RStudio team for addins and rstudioapi
#
# modified by AndrewLawrence based on:
#     https://github.com/fraupflaume
#     https://github.com/rstudio/addinexamples

#' pasteLastVal
#' Pastes the last value as a comment.
#'
#' @import rstudioapi stringr
#' @export
pasteLastVal <- function() {
  outputstr = utils::capture.output(
    tryCatch(
      print(.Last.value),
      warning = "",
      error = ""
    ))

  outputstr = paste(outputstr, collapse = "\n")
  outputstr = paste("#", outputstr)
  outputstr = gsub("\n", "\n# ", outputstr)
  outputstr = paste(outputstr, "\n")

  outputstr = stringr::str_replace_all(outputstr,stringr::regex("(\\033.*?m)"),"")


  rstudioapi::insertText(text=outputstr, id = rstudioapi::getSourceEditorContext()$id)

  rstudioapi::setCursorPosition(
    rstudioapi::document_position(rstudioapi::getSourceEditorContext()$selection[[1]][["range"]][["end"]][1], 1),
    id = rstudioapi::getSourceEditorContext()$id)
}



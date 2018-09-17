# Paste the .Last.value as a comment in the next line of code
# as a comment in the active Rstudio editor

pasteLastVal <- function() {
  rstudioapi::setCursorPosition(
    rstudioapi::document_position(rstudioapi::getSourceEditorContext()$selection[[1]][["range"]][["end"]][1] + 1, 1),
    id = rstudioapi::getSourceEditorContext()$id)

  outputstr = capture.output(
    tryCatch(
      print(.Last.value),
      warning = "",
      error = ""
    ))

  outputstr = paste(outputstr, collapse = "\n")
  outputstr = paste("#", outputstr)
  outputstr = gsub("\n", "\n# ", outputstr)

  rstudioapi::insertText(text=outputstr, id = rstudioapi::getSourceEditorContext()$id)

  rstudioapi::setCursorPosition(
    rstudioapi::document_position(rstudioapi::getSourceEditorContext()$selection[[1]][["range"]][["end"]][1] + 1, 1),
    id = rstudioapi::getSourceEditorContext()$id)
}



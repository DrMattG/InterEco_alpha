#function to create the interpretation page
interpretationUI <- function(id) {
  ns <- NS(id)
  # Define UI for module 1
  fluidPage(
    h3("Model Interpretation"),
    # Add UI components for module 1
  )
}

interpretationTabServer <- function(id,appData) {
  moduleServer(
    id,
    function(input, output, session) {
      
      
    }
  )
}
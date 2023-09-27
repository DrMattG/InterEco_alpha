#function to create the interpretation page

# module1.R
interpretationUI <- function(id) {
  ns <- NS(id)
  # Define UI for module 1
  fluidPage(
    h3("Module 4 Content"),
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
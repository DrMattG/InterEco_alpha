#function to create the validity page

validityUI <- function(id) {
  ns <- NS(id)
  # Define UI for module 1
  fluidPage(
    h3("Module 3 Content"),
    # Add UI components for module 1
  )
}

validityTabServer <- function(id,appData) {
  moduleServer(
    id,
    function(input, output, session) {
      
      
    }
  )
}
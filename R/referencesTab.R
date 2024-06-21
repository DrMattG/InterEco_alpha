#function to create the landing page
referencesUI <- function(id) {
  ns <- NS(id)
  # Define UI for module 1
  fluidPage(
    h3("Cited references")
    
    
  )
}

referencesTabServer <- function(id,appData) {
  moduleServer(
    id,
    function(input, output, session) {
      
      
    }
  )
}
#function to create the landing page
landingUI <- function(id) {
  ns <- NS(id)
  # Define UI for module 1
  fluidPage(
    h3("InterEco")

  )
}

landingTabServer <- function(id,appData) {
  moduleServer(
    id,
    function(input, output, session) {
      
      
    }
  )
}
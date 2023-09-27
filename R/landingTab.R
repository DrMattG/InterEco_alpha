#function to create the landing page

module1UI <- function(id) {
  ns <- NS(id)
  # Define UI for module 1
  fluidPage(
    h3("Module 1 Content")
    # Add UI components for module 1
  )
}

landingTab <- function(input, output, session) {
  ns <- session$ns
  # Define server logic for module 1
  # You can access input, output, and session here
}
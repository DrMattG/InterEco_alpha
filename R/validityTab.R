#function to create the validity page
validityUI <- function(id) {
  ns <- NS(id)
  # Define UI for module 1
  fluidPage(
    #page title
    h3("Model Validity"),
    
    # Add UI components
    verbatimTextOutput(ns("modelPrint")),
    plotOutput(ns("modelPlot"))
  )
}

validityTabServer <- function(id,appData) {
  moduleServer(
    id,
    function(input, output, session) {

      #print the app data
      output$modelPrint <- renderPrint(appData)
      
      #plot the model
      output$modelPlot <- renderPlot(plot(appData$model))
    }
  )
}
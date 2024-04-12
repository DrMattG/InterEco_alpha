#function to create the interpretation page
interpretationUI <- function(id) {
  ns <- NS(id)
  # Define UI for module 1
  fluidPage(
    h3("Model Interpretation"),
    
    # Add UI components for module 1
    plotOutput(ns("paramSpacePlot"))
    
  )
}

interpretationTabServer <- function(id,appData) {
  moduleServer(
    id,
    function(input, output, session) {
    
      # pairs plot of scatter in parameter space
      output$paramSpacePlot <- renderPlot(
        plot_param_space_scatter(model = appdata$model, data = appdata$data))  
    
    }
  )
}
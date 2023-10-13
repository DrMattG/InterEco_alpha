#function to create the validity page
validityUI <- function(id) {
  ns <- NS(id)
  # Define UI for module 1
  fluidPage(
    #page title
    h3("Model Validity"),
    
    # Add UI components
    plotOutput(ns("pairsPlot")),
    plotOutput(ns("interflexPlot"))
  )
}

validityTabServer <- function(id,appData) {
  moduleServer(
    id,
    function(input, output, session) {

      #plot pairsplot
      output$pairsPlot<-renderPlot(GGally::ggpairs(appdata$data))
      #plot the interflex
      output$interflexPlot <- renderPlot(RawPlot(Y = "mpg", D = appdata$pred,X = appdata$modx,Ylabel="mpg", Xlabel=appdata$modx,
                                                 Dlabel = appdata$pred,data = appdata$data))
    }
  )
}
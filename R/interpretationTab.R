#function to create the interpretation page
interpretationUI <- function(id) {
  ns <- NS(id)
  # Define UI for module 1
  fluidPage(
    h3("Model Interpretation"),
    
    fluidRow(
      column(width = 9, 
             plotOutput(ns("conditionalPlot"))),
      
      column(width = 3, 
             radioButtons(inputId = ns("modx_values"), 
                          label = "Moderator values", 
                          choices = list("mean-plus-minus", 
                                         "terciles")),
             
             "Here is where Becks will write some text 
             about the conditional effects plot"
      )
    ),
    
    fluidRow(
      column(width = 9, 
             plotOutput(ns("paramSpacePlot")))
    )  
  ) 
}

interpretationTabServer <- function(id, appData) {
  moduleServer(
    id,
    function(input, output, session) {
      # conditional effects plot
      output$conditionalPlot <- renderPlot({
        plot_conditional_effects(model = appdata$model, 
                                 data = appdata$data,
                                 pred = appdata$pred,
                                 modx = appdata$modx,
                                 modx.values = input$modx_values)
      })
      
      # pairs plot of scatter in parameter space
      output$paramSpacePlot <- renderPlot(
        plot_param_space_scatter(model = appdata$model, data = appdata$data)
      ) 
      
    }
  )
}
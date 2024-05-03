#function to create the interpretation page
interpretationUI <- function(id) {
  ns <- NS(id)
  # Define UI for module 1
  fluidPage(h3("Model Interpretation"),
            
            fluidRow(
              column(width = 8,
                     plotOutput(ns("conditionalPlot"))),
              
              column(
                width = 4,
                radioButtons(
                  inputId = ns("modx_values"),
                  label = "Moderator values for conditional effects plot",
                  choices = list(
                    "Mean  +/- 1 standard deviation" = "mean-plus-minus",
                    "Terciles" = "terciles",
                    "Choose values" = "custom"
                  )
                ),
                conditionalPanel(
                  condition = "input.modx_values == 'custom'",
                  ns = ns,
                  sliderInput(
                    ns("num1"),
                    label = "Value 1",
                    value = dplyr::pull(appdata$data, appdata$modx) |> min(na.rm = TRUE),
                    min = dplyr::pull(appdata$data, appdata$modx) |> min(na.rm = TRUE),
                    max = dplyr::pull(appdata$data, appdata$modx) |> max(na.rm = TRUE)
                  ),
                  sliderInput(
                    ns("num2"),
                    label = "Value 2",
                    value = dplyr::pull(appdata$data, appdata$modx) |> median(na.rm = TRUE),
                    min = dplyr::pull(appdata$data, appdata$modx) |> min(na.rm = TRUE),
                    max = dplyr::pull(appdata$data, appdata$modx) |> max(na.rm = TRUE)
                  ),
                  sliderInput(
                    ns("num3"),
                    label = "Value 3",
                    value = dplyr::pull(appdata$data, appdata$modx) |> max(na.rm = TRUE),
                    min = dplyr::pull(appdata$data, appdata$modx) |> min(na.rm = TRUE),
                    max = dplyr::pull(appdata$data, appdata$modx) |> max(na.rm = TRUE)
                  )
                )
              )
            ),
            
            fluidRow(column(width = 8,
                            plotOutput(ns("paramSpacePlot"))))
            )
}

interpretationTabServer <- function(id, appData) {
  moduleServer(id,
               function(input, output, session) {
                 # conditional effects plot
                 output$conditionalPlot <- renderPlot({
                   if (input$modx_values == "custom") {
                     
                     custom_modx_values <- c(input$num3, input$num2, input$num1)
                     
                     plot_conditional_effects(
                       model = appdata$model,
                       data = appdata$data,
                       pred = appdata$pred,
                       modx = appdata$modx,
                       modx.values = custom_modx_values
                     )
                     
                   } else {
                     plot_conditional_effects(
                       model = appdata$model,
                       data = appdata$data,
                       pred = appdata$pred,
                       modx = appdata$modx,
                       modx.values = input$modx_values
                     )
                   }
                   
                 })
                 
                 # pairs plot of scatter in parameter space
                 output$paramSpacePlot <-
                   renderPlot(
                     plot_param_space_scatter(
                       model = appdata$model, 
                       data = appdata$data)
                   )
                 
               })
}
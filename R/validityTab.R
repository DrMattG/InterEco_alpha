#function to create the validity page
validityUI <- function(id) {
  ns <- NS(id)
  # Define UI for module 1
  fluidPage(
    #page title
    h3("Model Validity"),
    
    # Add UI components
    plotOutput(ns("pairsPlot")),
    h4("Here shown are variable distributions (diagonal) and bivariate scatterplots, demonstrating that the independent variables were not highly correlated with one another (all Spearman’s rho values were <0.X), and an absence of outliers."),
    plotOutput(ns("vifPlot")),
    plotOutput(ns("residPlot")),
    plotOutput(ns("marginalPlot")),
    plotOutput(ns("lidPlot"))
  )
}

validityTabServer <- function(id,appData) {
  moduleServer(
    id,
    function(input, output, session) {

      #plot pairsplot
      output$pairsPlot <- renderPlot(GGally::ggpairs(appdata$data,
                                     columns = all.vars(formula(appdata$model)),
                                     cardinality_threshold = NULL))
      
      #plot VIF
      output$vifPlot <- renderPlot(plot_vif(appdata$model))
      
      # residual plots
      output$residPlot <- renderPlot(
        plot_resids(model = appdata$model, data = appdata$data))
      
      #plot the marginal effects
      output$marginalPlot <-
        renderPlot(
          interflex::interflex(
            estimator = "binning",
            data = as.data.frame(appdata$data),
            Y = all.vars(formula(appdata$model))[[1]],
            D = appdata$pred,
            X = appdata$modx
          )
        )
      
      # plot LID
      output$lidPlot <- 
        renderPlot(
          RawPlot(Y = all.vars(formula(appdata$model))[[1]],
                  D = appdata$pred,
                  X = appdata$modx,
                  Ylabel = all.vars(formula(appdata$model))[[1]], 
                  Xlabel = appdata$modx,
                  Dlabel = appdata$pred,
                  data = as.data.frame(appdata$data))
          )
      
    }
  )
}
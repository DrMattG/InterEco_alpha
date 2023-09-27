# InterEco

## What is InterEco?

InterEco is a tool to enable users to select and directly interact with underlying data and predictions generated by complex models. InterEco has great potential to facilitate nuanced interpretation, improve transparency and increase the impact of ecological research.

## How it works

All you need is your data and a model object. You use this to create a custom `appData` object.

Supported model types:

 * `lm()`

Each tab within the app is set up as modules in separate R files eg. `validityTab.R`
Each of these modules are set up to take the `appData` object as an argument. Here is some boilerplate code for a module eg. the model validity tab. Here we use the appData object to generate insights which are set as `output$...` objects which are then put into the ui within the `validityUI` function. This a very basic example which prints the `appData` object and plots the model:

```
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
```

## Setting up your InterEco experience

Overall process currently is:

 * Generate a study summary template then fill it out in the Rmarkdown document
 * Fit a model
 * Create an appData object
 * Source all the functions for the different modules etc. (this could be run automatically as part of running `generateInterEco()`?)
 * use `generateInterEco()` with the appData object you created as the argument

See contents of `demo.R`:

```
# load pacakges
library(shiny)

# run functions
source("R/appData.R")
source("R/landingtab.R")
source("R/summaryTab.R")
source("R/validityTab.R")
source("R/interpretationTab.R")
source("R/generateInterEco.R")

#create your study summary page
source("R/generateTemplateSummary.R")
generateTemplateSummary("test.Rmd") #creates the template which you can go and edit

# make the lm model with an interaction
fitiris <- lm(Petal.Length ~ Petal.Width * Species, data = iris)

#create the appData object
appdata <- makeAppData(data = iris, model = fitiris, pred="Petal.Width", modx="Species")

#generate interEco app and launch
generateInterEco(appdata)

```

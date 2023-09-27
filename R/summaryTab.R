#function to create the summary page
summaryUI <- function(id) {
  ns <- NS(id)
  # Define UI for module 2
  fluidPage(
    h3("Study Summary"),
    htmlOutput(ns("summaryHtml")),

  )
}

summaryTabServer <- function(id,appData) {
  moduleServer(
    id,
    function(input, output, session) {
      
      # Render the html
      output$summaryHtml <- renderUI({
        filePath <- "test.Rmd"
        #render the html from the rmarkdown
        html_file <- rmarkdown::render(filePath,output_file = tempfile())
        shiny::includeHTML(html_file)
      })
    
    }
  )
}


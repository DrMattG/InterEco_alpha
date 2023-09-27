#function to create the summary page
# summaryTab <- function(appData,filePath){
#   
#   # Render the Rmd to HTML
#   html_file <- rmarkdown::render(filePath,output_file = tempfile())
#   
#   shiny::tabPanel("Study Summary", shiny::includeHTML(html_file))
# }



summaryUI <- function(id) {
  ns <- NS(id)
  # Define UI for module 2
  fluidPage(
    h3("Module 2 Content"),
    # Add UI components for module 1
  )
}

summaryTabServer <- function(id,appData) {
  moduleServer(
    id,
    function(input, output, session) {

      
      
    }
  )
}






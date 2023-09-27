#function to create the summary page
# summaryTab <- function(appData,filePath){
#   
#   # Render the Rmd to HTML
#   html_file <- rmarkdown::render(filePath,output_file = tempfile())
#   
#   shiny::tabPanel("Study Summary", shiny::includeHTML(html_file))
# }



module2UI <- function(id) {
  ns <- NS(id)
  # Define UI for module 2
  fluidPage(
    h3("Module 2 Content"),
    # Add UI components for module 1
  )
}

summaryTab <- function(input, output, session) {
  # Define server logic for module 1
  # You can access input, output, and session here
}

#testing
#generateTemplateSummary("test.Rmd")
#summaryTab(NA,"test.Rmd")




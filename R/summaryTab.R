#function to create the summary page
summaryTab <- function(appData,filePath){
  
  # Render the Rmd to HTML
  html_file <- rmarkdown::render(filePath,output_file = tempfile())
  
  shiny::tabPanel("Study Summary", shiny::includeHTML(html_file))
}

#testing
#generateTemplateSummary("test.Rmd")
#summaryTab(NA,"test.Rmd")

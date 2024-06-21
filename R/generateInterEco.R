generateInterEco <- function(appData){

  ui <- fluidPage(
    navbarPage(
      "InterEco",
      id="navbar",
      tabPanel("Landing", id = "landingTab"),
      tabPanel("Summary", id = "summaryTab"),
      tabPanel("Validity", id = "validityTab"),
      tabPanel("Interpretation", id = "interpretationTab"),
      tabPanel("References", id= "referencesTab")
    ),
    uiOutput("tab_content")
  )
  
  server <- function(input, output, session) {
    
    observeEvent(input$navbar, {
      tab <- input$navbar

      output$tab_content <- renderUI(
        if (tab == "Landing") {
          landingUI("landingTab")
        }  else if (tab == "Summary") {
          summaryUI("summaryTab")
        } else if (tab == "Validity") {
          validityUI("validityTab")
        } else if (tab == "Interpretation") {
          interpretationUI("interpretationTab")
        } else if (tab== "References"){
          referencesUI("referencesTab")
        }
      )
    })
    
    # Call module server functions
    landingTabServer("landingTab",appData=appData)
    summaryTabServer("summaryTab",appData=appData)
    validityTabServer("validityTab",appData=appData)
    interpretationTabServer("interpretationTab",appData=appData)
    referencesTabServer("referenceTab", appData = appData)
    
  }
  
  shinyApp(ui, server)
}

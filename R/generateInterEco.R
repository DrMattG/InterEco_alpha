generateInterEco <- function(appData){

  ui <- fluidPage(
    navbarPage(
      "InterEco",
      tabPanel("Landing", id = "landingTab"),
      tabPanel("Summary", id = "summaryTab"),
      tabPanel("Validity", id = "validityTab"),
      tabPanel("Interpretation", id = "interpretationTab"),
      uiOutput("tab_content")
    )
  )
  
  server <- function(input, output, session) {
    observeEvent(input$tab_content, {
      tab <- input$tab_content
      output$tab_content <- renderUI({
        tagList(
          if (tab == "landingTab") {
            landingUI("landingTab")
          }  else if (tab == "summaryTab") {
            summaryUI("summaryTab")
          } else if (tab == "validityTab") {
            validityUI("validityTab")
          } else if (tab == "interpretationTab") {
            interpretationUI("interpretationTab")
          }
        )
      })
    })
    

    # Call module server functions
    landingTabServer("landingTab",appData=appData)
    summaryTabServer("summaryTab",appData=appData)
    validityTabServer("validityTab",appData=appData)
    interpretationTabServer("interpretationTab",appData=appData)
  }
  
  shinyApp(ui, server)
}
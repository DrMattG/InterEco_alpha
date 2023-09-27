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
    observeEvent(input$landing, {
      output$tab_content <- renderUI({
        tagList(
          module1UI("landingTab")
        )
      })
    })
    
    observeEvent(input$summary, {
      output$tab_content <- renderUI({
        tagList(
          module2UI("summaryTab")
        )
      })
    })
    
    observeEvent(input$validity, {
      output$tab_content <- renderUI({
        tagList(
          module3UI("validityTab")
        )
      })
    })
    
    observeEvent(input$interpretation, {
      output$tab_content <- renderUI({
        tagList(
          module4UI("interpretationTab")
        )
      })
    })
    
    # Call the respective module's server function
    moduleServer(landingTab, "landingTab")
    moduleServer(summaryTab, "summaryTab")
    moduleServer(validityTab, "validityTab")
    moduleServer(interpretationTab, "interpretationTab")
  }
  
  shinyApp(ui, server)
}
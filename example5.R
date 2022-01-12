# Proje 5 isim değiştikçe sonuçların değiştiği interaktif bir karşılama

ui <- fluidPage(
 textInput("name", "Adın ne?"),
 textOutput("greeting")
 
)
server <- function(input, output, session) {
  output$greeting <- renderText({
    paste0("Merhaba " ,input$name, " !")
  })
  
}
shinyApp(ui,server)

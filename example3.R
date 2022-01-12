# Proje 3 hello başlıklı hello içeriği üretiyor amaç arayüzü anlamak

ui <- fluidPage(
  textOutput("text"),
  verbatimTextOutput("print")
)
server <- function(input,output,session) {
  output$text <- renderText("hello!")
  output$print <- renderPrint("hello!")
}

shinyApp(ui,server)

# Proje 4 quantum verisini dinamic hale getiriyor ama bunu kullanmasak da olur şimdilik

ui <- fluidPage(
 dataTableOutput("dynamic")
 
)
server <- function(input, output, session) {
  output$dynamic <- renderDataTable(quantum, options = list(pageLength = 10))
  
}
shinyApp(ui,server)
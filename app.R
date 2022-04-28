
source("socDataProj.r")
library(shiny)

# Define UI for application
ui <- fluidPage(
  textInput("text1", label = h3("Text input"), value = "Enter first subreddit..."),
  textInput("text2", label = h3("Text input"), value = "Enter next subreddit..."),
  actionButton("button", label = "Submit")
)

# Define server logic
server <- function(input, output, session) {
  observeEvent(input$button, {
  output$value = find_reddit(input$text1, input$text2)
  }
  )
}

# Run the application 
shinyApp(ui = ui, server = server)

library(shiny)

ui <- fluidPage(
  titlePanel("Arithmetic App"),
  sidebarLayout(
    sidebarPanel(
      numericInput("num1", "Enter first number:", value = 0),
      numericInput("num2", "Enter second number:", value = 0),
      actionButton("add_btn", "Add"),
      actionButton("mult_btn", "Multiply")
    ),
    mainPanel(
      h3("Result:"),
      textOutput("result")
    )
  )
)

server <- function(input, output, session) {
  # holds the latest computed value
  result_val <- reactiveVal(NULL)
  
  # when "Add" is clicked
  observeEvent(input$add_btn, {
    result_val(input$num1 + input$num2)
  })
  
  # when "Multiply" is clicked
  observeEvent(input$mult_btn, {
    result_val(input$num1 * input$num2)
  })
  
  output$result <- renderText({
    if (is.null(result_val())) "Click a button to calculate."
    else result_val()
  })
}

shinyApp(ui = ui, server = server)

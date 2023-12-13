library(shiny)

shinyServer(function(input, output) {
  output$distPlot <- renderPlot({
    
    #透過 if 條件來判斷 目前的變數為何，應呈現哪個畫面及程式
    if (input$method == "norm") 
    {dist <- rnorm(input$obs, mean = input$mu, sd = input$sd)}
    if (input$method == "st") 
    {dist <- rt(input$obs, df = input$df)}
    hist(dist)
  })
})
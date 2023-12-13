library(shiny)
shinyUI(pageWithSidebar(
  
  headerPanel("Generating distribution"),
  
  sidebarPanel(
    selectInput("method", "Choose distribution:", choices=c("Normal"="norm", "Student t"="st")),
    helpText("Setting parameter(s) for distribution model"),
    
    # 下拉式選單 -> 來選擇要選哪個 變數
    conditionalPanel(condition="input.method=='norm'",
                     numericInput(inputId="mu", label="mean", value=0),
                     numericInput(inputId="sd", label="standard deviation", value=1, min=0)
    ),
    conditionalPanel(condition="input.method=='st'",
                     numericInput(inputId="df", label="Df", value=10, min=1)
    ),
    #slider input 為共用值
    sliderInput(inputId="obs", 
                label="Number of observations:", 
                min = 1, max = 1000, value = 500)
  ),
  
  mainPanel(
    plotOutput("distPlot")
  )
  
))
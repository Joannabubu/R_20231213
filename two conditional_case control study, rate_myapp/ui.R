library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Sample size calculator"),
  
  sidebarPanel(
    selectInput("method", "Choose a method:", choices=c("Rate"="rate", "Case Control Study"="cc")),
    # 呼叫變數 "rate"
    conditionalPanel(condition="input.method=='rate'",
                     numericInput("Sig", "Two-sided significance level:", min = 0, max = 1.000, value = 0.05),
                     numericInput("p", "The expected rate:", min = 0, max = 1, value = 0.5),
                     numericInput("X", "Acceptable error range:", min = 0, max = 1, value = 0.03)
    ),
    # 呼叫變數 "case control" -> cc
    conditionalPanel(condition="input.method=='cc'",
                     numericInput("alpha", "Two-sided significance level:", min = 0.001, max = 0.999, value = 0.05),
                     numericInput("power", "Power:", min = 0.001, max = 0.999, value = 0.8),
                     numericInput("OR", "Smallest difference of clinical/biological importance:", min = 0.01, max = 100, value = 1.5),
                     numericInput("r", "The ratio of Case/Control:", min = 0.01, max = 100, value = 1),
                     numericInput("p0", "Proportion of controls with exposures:", min = 0.001, max = 0.999, value = 0.2) 
    ),
    radioButtons("Color", "Select the color of histogram:", choices = c("Red" = "red", "Blue" = "blue", "Green" = "green"))
  ),
  
  mainPanel(
    h3(textOutput("text1")),
    h4(textOutput("text2")),
    h3(textOutput("text3")),
    h4(textOutput("text4"))
  )
))
library(shiny)

# Define UI for application that calculate the needed sample size 
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Sample size for case Control study"),
  
  # Sidebar with numeric inputs for significance level, expected rate, acceptable error range.
  sidebarPanel(
    numericInput("alpha", "Two-sided significance level:", min = 0.001, max = 0.999, value = 0.05),
    numericInput("power", "Power:", min = 0.001, max = 0.999, value = 0.8),
    numericInput("OR", "Smallest difference of clinical/biological importance:", min = 0.01, max = 100, value = 1.5),
    numericInput("r", "The ratio of Case/Control:", min = 0.01, max = 100, value = 1),
    numericInput("p0", "Proportion of controls with exposures:", min = 0.001, max = 0.999, value = 0.2)   
  ),
  
  # Show the outcome
  mainPanel(
    h3(textOutput("text1")),
    h4(textOutput("text2")),
    h3(textOutput("text3")),
    h4(textOutput("text4"))
  )
))
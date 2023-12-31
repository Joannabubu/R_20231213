library(shiny)

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Hello Shiny!"),
  # headerPanel : 標題
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    sliderInput("obs", "Number of observations:", min = 0, max = 1000, value = 500)
    # 新增的拉條
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("distPlot")
  )
))



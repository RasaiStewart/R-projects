# Interactive histogram using Rshiny.

library(shiny); library(ggplot2) # ggplot Library
library(plotly) # plotly for further interactivity
# Define UI for app that draws a histogram ----
ui <- fluidPage(
  titlePanel("Exercise 1: Basic Normal Histogram"), # App title
  sidebarLayout(# Sidebar layout with input and output definitions
    sidebarPanel(# Sidebar panel for inputs ----
                 # Input: Slider for the number of bins ----
                 numericInput(inputId = "noOfSamples", label="Number of Samples:",
                              value=1000, min = 1, step = 1),
                 numericInput(inputId = "mu", label="Value for mu:", value=0),
                 sliderInput(inputId = "sigma", label = "Value for sigma:", value =
                               1, min = 0, max = 5, step=0.1,
                             animate = animationOptions(100)),
                 sliderInput(inputId = "noOfBins", label = "Number of bins:", min =
                               1, max = 200, value = 20, animate = animationOptions(100))),
    mainPanel(# Main panel for displaying outputs ----
              plotlyOutput(outputId = "distPlot") # Output plotly: Histogram
    )
  ))


# Define server logic required to draw a histogram ----
server <- function(input, output) {
  # 1. It is "reactive" and therefore should be automatically
  # re-executed when inputs (input$...) change
  # 2. Its output type is a plotly
  output$distPlot <- renderPlotly({
    N <- input$noOfSamples # Inputs from ui
    mu <- input$mu
    sigma <- input$sigma
    noOfBins <- input$noOfBins
    x <- rnorm(N, mean=mu, sd=sigma) # Create samples
    Nsamples <- as.data.frame(x) # Make a dataframe for ggplot
    binBreak <- seq(min(Nsamples$x), max(Nsamples$x), length.out = noOfBins)
    # Create bins for histogram
    p <- ggplot(data=Nsamples, aes(x=x)) + # Specify data and x
      geom_histogram(# Specify histogram for ggplot
        breaks=binBreak, # Specify bins
        alpha=.5, color="light blue", fill="red") + # Design colours
      xlim(-20,20)+ # Set x limits
      labs(title="Histogram of Samples") # Add title
    ggplotly(p) # Create plotly interactive object
  })}
shinyApp(ui = ui, server = server) # Create Shiny
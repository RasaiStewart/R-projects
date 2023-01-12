# Show 100 samples from a standard normal distribution.
library(shiny) # Load Shiny Package
ui <- fluidPage( # Create a HTML page ----
                 titlePanel("Hello Shiny!"), # App title ----
                 # Output: Define Histogram ----
                 plotOutput(outputId = "distPlot")
)
# Define server logic required fill the UI ----
server <- function(input, output) { # Server
  output$distPlot <- renderPlot({ # Create Histogram Plot
    hist(rnorm(1000,0,1), col = "#75AADB", border = "white",
         xlab = "x",
         main = "Histogram Normal Distribution")
  })
}
# Create Shiny app ----
shinyApp(ui = ui, server = server)

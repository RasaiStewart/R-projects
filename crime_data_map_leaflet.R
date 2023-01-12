# User interface
library(shiny);options(shiny.maxRequestSize = 900*1024^2)
library(leaflet)
library(colortools)
ui <- fluidPage(
  titlePanel("Exercise 2: App to Visualise UK Crime Data"),
  # App title ----
  sidebarLayout(# Sidebar layout
    sidebarPanel(# Sidebar panel for inputs ----
                 fileInput("C:\Users\User\Documents\computational_methods_and_numerical_techniques\exercises\ea8ab35d3f18617637784ca712f317a2c4edbafc (3)\2019-09\2019-09-city-of-london-street.csv"', 'Upload a .csv Raw Claim Data File',
                            accept = c(".csv")), # File input panel
                 actionButton("startButton","Start")), # Action button
    mainPanel(# Main panel for displaying outputs ----
              leafletOutput(outputId = "distPlot", width = "100%",
                            height = "700px") # Leaflet Output
    )
  )
)

# Server 1
server <- function(input, output) {
  dataInput1 <- eventReactive(input$startButton,{
    # Event reacts to button press
    inFile1 <- input$file1 # Accept the input files
    if(is.null(inFile1))
      return(NULL)
    file.rename(inFile1$datapath,
                paste(inFile1$datapath, ".csv", sep=""))
    crimeData<- read.csv(paste(inFile1$datapath,
                               ".csv", sep=""), header = TRUE, stringsAsFactors = FALSE)
    crimeData<- crimeData[!is.na(crimeData$Longitude) | !is.na(
      crimeData$Latitude), ]
    crimeData$Crime.type<-as.factor(crimeData$Crime.type)
    return(crimeData)
  })
  output$distPlot <- renderLeaflet({
    crimeData<-dataInput1()
    
# Server 2
    # Data is carried from reactive event
    pal <- colorFactor(wheel("tomato", num = length(unique(
      crimeData$Crime.type))),
      domain = unique(crimeData$Crime.type))
    m <- leaflet(crimeData) %>%
      setView(lng = mean(crimeData$Longitude),
              lat = mean(crimeData$Latitude), zoom = 13)%>%
      addTiles() %>% # Add default OpenStreetMap map
      addCircleMarkers(lng=~Longitude, lat=~Latitude,
                       popup=~Crime.type, label =~ Crime.type,
                       radius=7, color = ~pal(Crime.type),
                       stroke = FALSE, fillOpacity = 1)
    m # Print the map
  })
}
shinyApp(ui, server)
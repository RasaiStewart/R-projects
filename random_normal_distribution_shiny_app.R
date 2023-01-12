# Create a Shiny app in which user can simulate N random
# samples from a normal distribution N(µ, σ2
# ) and the app
# produces a ggplot histogram of the samples for a given number of
# bins B. Modify the app produce Bin(n, p) histogram.

# Create a ggplot histogram.
library(ggplot2) # ggplot Library
library(plotly) # plotly for further interactivity
N <- 1000 # To be changed via the inputId: noOfSamples
mu <- 0 # To be changed via the inputId: mu
sigma <- 1 # To be changed via the inputId: sigma
noOfBins <- 20 # To be changed via the inputId: noOfBins
x <- rnorm(N, mean=mu, sd=sigma) # Create samples
Nsamples <- as.data.frame(x) # Make a dataframe for ggplot
binBreak <- seq(min(Nsamples$x), max(Nsamples$x), length.out = noOfBins)
# Create bins for histogram
p <- ggplot(data=Nsamples, aes(x=x)) + # Specify data and x axis
  geom_histogram(# Specify histogram for ggplot
    breaks=binBreak, # Specify bins
    alpha=.5, color="light blue", fill="red") +
  # Design colours for histogram
  xlim(-20,20)+ # Set x limits
  labs(title="Histogram of Samples") # Add title
ggplotly(p) # Create plotly interactive object
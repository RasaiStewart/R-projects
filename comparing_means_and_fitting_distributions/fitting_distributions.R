# Fitting distributions.

# Install relevant packages.
install.packages("fitdistrplus")

# Load packages.
library(fitdistrplus)



# Data to be used.
data("groundbeef", package = "fitdistrplus")
my_dataset <- groundbeef$serving
my_data

# Plot a graph for density and cumulative distribution.
plotdist(sample, histo = TRUE, demp = True)

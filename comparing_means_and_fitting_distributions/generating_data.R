# Install relevant packages.
install.packages("dplyr")
install.packages("DT")
install.packages("ggplot2")
install.packages("ggpubr")
install.packages("fitdistrplus")
install.packages("tidyverse")


# Load relevant packages.
library(dplyr)
library(ggplot2)
library(ggpubr)
library(DT)
library(ggplot2)
library(fitdistrplus)
library(tidyverse)


# Task 1: Data generation
# Generate dataset consisting of the weights of mice before
# and after treatment
# with the parameters: mean = 20 and variance = 2.
weight_before < c(rnorm(n = 200, mean = 20, sd = sqrt(2)))
weight_after <- c(rnorm(n = 200, mean = 20, sd = sqrt(2.5)))
#weight_before <- rnorm(n = 200, mean = 20, sd = sqrt(2))
#weight_after <- rnorm(n = 200, mean = 21, sd = sqrt(2.5))
#weight_before
#weight_after
# combine the data frames for mice.
mice <- cbind(weight_before, weight_after)
mice

# Generate a dataset containing the weights of rats before and after treatment
# with mean = 21 and variance = 2.5

rats <- data.frame(before = weight_before, after = weight_after)
rats <- data.frame(weight_before = c(rweibull(n = 200,shape = 10, scale = 20)))
weight_before <- c(rweibull(n = 200, shape = 21, scale = 2.5))
weight_after <- c(rweibull(n = 200, shape = 9, scale = 21))
rats <- cbind(weight_before, weight_after)
mice <- data.frame(before = weight_before, after = weight_after)
mice
mice$weight_before
rats <- data.frame(before = weight_before, after = weight_after)
mice$weight_after
rats

# Convert mice dataset from numeric to a factor variable.
mice$weight_before < as.factor(mice$weight_before)
plot(mice)
#rats <- ggplot(data=mice, aes(x=weight_after)) +
#  geom_qqplot(aes(x = weight_before, y = weight_after))

class(mice)
class(rats)
dim(mice)
dim(rats)

# Generate a qq plot and box plot with data from the mice dataset.
ggplot(mice, aes(sample = weight_before)) +
  stat_qq() + stat_qq_line()

ggplot(mice, aes(x = weight_before, y = weight_after)) +
  stat_boxplot()
# Generate a box plot with data from the rats dataset.
ggplot(rats, aes(x = weight_before, y = weight_after)) +
  stat_boxplot()


#geom_qq(
#  geom = "density")

str(mice)
str(rats)
summary(mice)
summary(rats)
head(mice)
write.table(mice)

gather("weight_before", "weight_after")
#unite("weight_before", "weight_after")
View(mice)
#ggpubr::ggqqplot(mice$weight_before)


mice <- data.frame(before = weight_before, after = weight_after)
mice
mice$weight_before
mice$weight_after

mice <- lapply(mice, as.numeric)
str(mice)
lapply(rats, as.numeric)
str(rats)
# Perform shapiro wilk test on rat and mice dataset.
shapiro.test(rats)
summary(rats)

summary(mice)

install.packages("data.table")


library(data.table)
mydata <- fread('https://www.kaggle.com/mustafaali96/weight-height')
head(mydat)

library(rcurl)


# Sixty KitchenAid proffesional grade are manufactured per day.
# Prior to shipping, a simple random sample of 12 must be selected
# each day's prodution and carefully rechecked for possible defects.

# (a) Describe a procedure for obtaining a simple random sample
# of 12 mixers from a day's production of 60 mixers.

# (b) Use R to implement the procedure describe in part (a).

# Solution
# As a first step, we identify each mixer with a number from 1 to 60.
# Next we write each number from 1 to 60 on seperate, identical slips of paper,
# put all 60 slips of paper in a box, and mix them thoroughly.
# Finally. we select 12 slips from the box, one at a time and
# without replacement. The 12 numbers selected specify/represent the desired
# sample of size n = 12 mixers from a day's production of 60. This process can
# be implemented in R with the command:

y <- sample(seq(1, 60), size=12)

# 4. In the Macworld Conference Expo Keynote Adress on January 9, 2007,
# Steve Jobs announced a new product the iPhone. A technology consultant
# for a consumber magazine wants to slect 15 devices from their pilor lot
# of 17 iPhones to inspect feature coordination, Describe from the lot of
# 70 iPhones. Use R to select a sample of 15. Give the R commands and the sample
# you obtained.

# Solution
# As a first step, we identify each iPhone with a number from 1 to 60.
# Next we write each number from 1 to 70 in seperate, identical boxes,
# put all 70 boxes in a container, and mix them thoroughly.
# Finally. we select 15 boxes from the container, one at a time and
# without replacement. The 15 numbers selected specify/represent the desired
# sample of size n = 70 iPhones from a day's production of 70 chosen for feature
# Inspection. This process can be implemented in R with the command:

iPhone <- sample(seq(1, 70), size=15, replace=FALSE)
iPhone

# The sample obtained using this command is
[ 51 17 21 33 45  4  7 58 44 48 68  1 35 64 38]


# 5. A distributor has just received a shipment of 90 drain pipes from a major
# manufacturer of such pipes. The distributor wishes to select  a sample of size
# 5 to carefully inspect fro defets. Describe a method for obtaining a simple
# rand sample of 5 pipes from the shipment. Use R to implement the method. Give
# the R commands and the sample you obtained.

drain_pipes <- sample(seq(1, 90), size=5, replace=FALSE)
drain_pipes

# The sample of obtained using this command is
# [1]  1 27 88 59 40


# 6. A service agency wishes to assess its clients' view on quality of service
# over the past year. Computer records identify 1000 clients over the past 12
# months, and a decision is made select 100 clients to survey.

# (a) Describe a procedure for selecting a simple random sample of 100 clients
# from last year's population of 1000 clients.
# (b) The population of 1000 clients consists of 800 Caucasian-Americans.
# Descrobe an alternative procedure for selecting a representative rand sample
# of 1000 clients.
# (c) Gove the R commands for implementing the sampling procedures describe in
# parts (a) and (b).

clientData <- sample(seq(1, 1000), size=100, replace=FALSE)
clientData

# The sample obtained using the above command is
# [1] 571 999 968 388 873 681  66 472 651 817 392 391 621 689 289
# [16] 883 332 837   6 316 712 648 112 320 382 404 520 793 179 130
# [31] 541 389 784 687 238 684 237 989 673 224 991 215  36  56 499
# [46] 116 441 896  21 177  59  54 355 167  95 222 252 735 773 276
# [61]  22 444 522 599 692 596 399 880 982  24 195 767 198 572  78
# [76] 756 696  25 544 908 695 901 115 268 911 156 707 639 682 145
# [91] 753 270 635 723 549 861 703 986 577 781


p57 -> factorial(7)/factiorial(7-5)
choose(7, 5)


# Two cards will be selected from a deck of 52 cards.
# How many outcomes are there if the first card will be given to player 1 and
# the second card given to player 2?
choose(52, 2)


# Install relevant packages.
install.packages(measurements)
install.packages(DT)
install.packages(ggplot2)
install.packages(tidyverse)

#Load relevamt packages into memory.
library(measurements)
library(DT)
library(ggplot2)

# Example of sampling variability.
# Import height-weight dataset from Kaggle.
mydata <- read.csv("weight-height.csv")
# Use measurement library for the conversions found below.
mydata$Height <- conv_unit(mydata$Height, "inch", "cm")
mydata$Height <- round(mydata$Height,2)
mydata$Weight <- conv_unit(mydata$Weight, "lbs", "kg")
mydata$Weight <- round(mydata$weight,2)
summary(mydata)


datatable(mydata, options = list(pageLength = 10,
                                 dom = 'tip',
                                 scrollY = 500,
                                 scroller = TRUE,
                                 scrollX = TRUE,
                                 fixedColumns = TRUE), width = '100%', height = '100%')

# This population consists of 100000 members. The mean for the population
# height is:
mean(mydata$Height)
168.5736

# Take a sample of size 10
x <- sample(mydata$Height,10)

# Find its mean
mean(x)
168.704

# Repeat this 1000 times.
heightSM <- 0
smapleSize <- 10
rep <- 1000
set.seed(100)
for (i in 1:rep) {
  heighSM[i] < mean(sample(mydata$Height,smapleSize))
}
heightSM <-as.data.frame(heightSM)
kable(head(heightSM), caption = "A few of the mean heights") # Use knitr library.


# Use ggplot 2 library to plot a histograph of the repeated sampling procedure.
x < ggplot(data=heightSM, aes(x=heightSM)) +
  geom_histogram(aes(y =..density..), position="identity",
                 breaks=seq(min(heightSM$heightSM), max(heightSM$heightSM),
                            length.out = 20),
                 alpha=.5, color="light blue", fill="red") +
  geom_density(alpha=.3, fill="brown", col="black") + 
  geom_vline(xintercept=mean(heightSM$heightSM), linetype="dashed", color = "red", size=1) +
  geom_vline(xintercept=mean(mydata$Height), linetype="dashed", color = "blue", size=1) +
  annotate(geom="text", x=162, y=0.108, label="Population Mean",
           color="blue") + 
  geom_curve(aes(x = 162.5, y = 0.11, xend = mean(mydata$Height), yend = 0.14), arrow = arrow(length = unit(0.5, "cm")), curvature = -0.2)+ 
  labs(title="Sample Mean Histogram")+
  xlab(paste("Mean Height for Each Sample of Size", smapleSize))
x)  

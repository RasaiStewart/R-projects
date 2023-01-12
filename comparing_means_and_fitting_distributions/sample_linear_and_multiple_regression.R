# Install relevant packages.
install.packages(datarium)
remotes::install_github("kassambara/detarium")
library(longley)
data("marketing", package = "datarium")
head(marketing, 5)
marketing
# Generate a linear regresstion about cars using the cars dataset.
datacar <- cars
# Distance is the response variable (Y).
# Speed is the explanatory variable (X)
plot(cars$speed,cars$dist)

# Test the relationship between X and Y.
cor.test(cars$speed,cars$dist)

# Develop a linear model.
LinearMod <- lm(dist~speed,data=datacar)
LinearMod
summary(LinearMod)
anova(LinearMod)
aov(dist~speed,data=datacar)

# Model checking
# Check for any assumptions
plot(LinearMod)
hist(LinearMod$residuals)

# Model checking using ggplot.

#Perform tests to check for normality.
shapiro.test(LinearMod$residuals)
# Shapiro Wilk test rejects the null hypothesis
# that residual are normally distributed.

# Multiple linear regression model.
model1 <- lm(sales ~ ., data = marketing)
summary(model1)
anova(model1)

# Develop a reduced model.
model <- lm(sales~facebook+youtube,data = marketing)
summary(model)
anova(model)

# Compare models
anova(model,model1)
# Model 1 is better because it does not have a
# significant p-value (<0.05). If the p-value was
# singificant (>0.05) model 2 would be better.

plot(model1)
hist(model1$residuals)
shapiro.test(model1$reiduals)
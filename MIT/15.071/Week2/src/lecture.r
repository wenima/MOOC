# commands to follow the lecture Unit 2: Linear Regression
# set working directory:
setwd('~/github/MOOC/MIT/15.071/Week2/data/')
#The following figure shows three data points and the best fit line: y = 3x + 2.
# The x-coordinate, or "x", is our independent variable and the y-coordinate, or "y",
# is our dependent variable.
# load into df
data <- data.frame(x=c(0, 1, 1), y=c(2, 2, 8))
# visualize the data
plot(data, pch=15, xlab='Independent', ylab='Dependent', ylim=c(0,10), xlim=c(-3, 3))
# fit model
fit <- lm(y ~ x, data = data)
# add line in plot
abline(fit)
# What is the baseline prediction?
(2 + 2 + 8) / 3
# plot baseline
baseline <- sum(data$y) / nrow(data)
plot(data, pch=15, xlab='Independent', ylab='Dependent', ylim=c(0,10), xlim=c(-3, 3))
abline(a=baseline, b=0, col='blue')
# What is the Sum of Squared Errors (SSE) ?
# SSE = Sum of squared residuals ; Residual is the distance from predicted vs actual
# 0^2 + -3^2 + 3^2 == 0 + 9 + 9 == 18
# define a function squares
squares <- apply(data, 1, function(row) {
  y <- row[2]
  yhat <- round(predict(fit, newdata = data.frame(x=row[1], y=row[2])))

  (y - yhat)^2
})
# define SSE as a function
SSE <- sum(squares)
# What is the Total Sum of Squares (SST) ?
# SST = The term on the left-hand side of this equation is the sum of the squared
# distances from all points to yhat
# (2 - 4)^2 + (2 - 4)^2 + (8 - 4)^2 == 4 + 4 + 16 == 24
# defining a function for squares
squares <- apply(data, 1, function(row) {
  y <- row[2]
  yhat <- baseline

  (y - yhat)^2
})
# define SST as a function
SST <- sum(squares)
# What is the R² of the model?
# R^2 == 1 - (SSE / SST)
1 - SSE/SST

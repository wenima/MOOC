# Stock dynamics
#
# A stock market is where buyers and sellers trade shares of a company, and is
# one of the most popular ways for individuals and companies to invest money.
# The size of the world stock market  is now estimated to be in the trillions.
# The largest stock market in the world is the New York Stock Exchange (NYSE),
# located in New York City. About 2,800 companies are listed on the NSYE. In this
# problem, we'll look at the monthly stock prices of five of these companies: IBM,
# General Electric (GE), Procter and Gamble, Coca Cola, and Boeing. The data
# used in this problem comes from Infochimps.
#
# Download and read the following files into R, using the read.csv function: IBMStock.csv,
# GEStock.csv, ProcterGambleStock.csv, CocaColaStock.csv, and BoeingStock.csv.
# (Do not open these files in any spreadsheet software before completing this problem
# because it might change the format of the Date field.)
#
# Call the data frames "IBM", "GE", "ProcterGamble", "CocaCola", and "Boeing",
# respectively. Each data frame has two variables, described as follows:
#
# Date: the date of the stock price, always given as the first of the month.
# StockPrice: the average stock price of the company in the given month.
# In this problem, we'll take a look at how the stock dynamics of these companies have changed over time.

# Load dataframes
ibm = read.csv("IBMStock.csv")
boeing = read.csv("BoeingStock.csv")
ge = read.csv("GEStock.csv")
procter = read.csv("ProcterGambleStock.csv")
cc = read.csv("CocaColaStock.csv")
# Substituting Date for a Date object
ibm$Date = as.Date(ibm$Date, "%m/%d/%y")
boeing$Date = as.Date(boeing$Date, "%m/%d/%y")
procter$Date = as.Date(procter$Date, "%m/%d/%y")
ge$Date = as.Date(ge$Date, "%m/%d/%y")
cc$Date = as.Date(cc$Date, "%m/%d/%y")

# Problem 1.1 - Summary Statistics
# Our five datasets all have the same number of observations. How many observations are there in each data set?
str(ibm)

# Problem 1.2 - Summary Statistics
# What is the earliest year in our datasets?
min(ibm$Date)

# Problem 1.3 - Summary Statistics
# What is the latest year in our datasets?
max(ibm$Date)

# Problem 1.4 - Summary Statistics
# What is the mean stock price of IBM over this time period?
mean(ibm$StockPrice)

# Problem 1.5 - Summary Statistics
# What is the minimum stock price of General Electric (GE) over this time period?
min(ge$StockPrice)

# Problem 1.6 - Summary Statistics
# What is the maximum stock price of Coca-Cola over this time period?
max(cc$StockPrice)

# Problem 1.7 - Summary Statistics
# What is the median stock price of Boeing over this time period?
median(boeing$StockPrice)

# Problem 1.8 - Summary Statistics
# What is the standard deviation of the stock price of Procter & Gamble over this time period?
sd(procter$StockPrice)

# Problem 2.1 - Visualizing Stock Dynamics
# Around what year did Coca-Cola has its highest stock price in this time period?
plot(cc$Date, cc$StockPrice, type='l')

# Problem 2.2 - Visualizing Stock Dynamics
# In March of 2000, the technology bubble burst, and a stock market crash occurred.
# According to this plot, which company's stock dropped more?
plot(cc$Date, cc$StockPrice, type='l', col='red') # plot stock1 with color red
lines(procter$Date, procter$StockPrice) # add stock2
abline(v=as.Date(c("2000-03-01")), lwd=2) #draw vertical line

# Problem 2.3 - Visualizing Stock Dynamics
# 1) Around 1983, the stock for one of these companies (Coca-Cola or Procter and Gamble)
# was going up, while the other was going down. Which one was going up?
# Answer: Coca-Cola
# In the time period shown in the plot, which stock generally has lower values?
# Answer: Coca-Cola

# Problem 3.1 - Visualizing Stock Dynamics 1995-2005
# Which stock fell the most right after the technology bubble burst in March 2000?
plot(cc$Date[301:432], cc$StockPrice[301:432], type="l", col="red", ylim=c(0,210))
lines(procter$Date[301:432], procter$StockPrice[301:432])
lines(boeing$Date[301:432], boeing$StockPrice[301:432], col='green')
lines(ibm$Date[301:432], ibm$StockPrice[301:432], col='blue')
lines(ge$Date[301:432], ge$StockPrice[301:432], col='purple')
abline(v=as.Date(c("2000-03-01")), lwd=2)
# Answer: GE

# Problem 3.2 - Visualizing Stock Dynamics 1995-2005
# Which stock reaches the highest value in the time period 1995-2005?
# Answer: IBM

# Problem 3.3 - Visualizing Stock Dynamics 1995-2005
# In October of 1997, there was a global stock market crash that was caused by an
# economic crisis in Asia. Comparing September 1997 to November 1997, which
# companies saw a decreasing trend in their stock price? (Select all that apply.)
plot(cc$Date[330:335], cc$StockPrice[330:335], type="l", col="red", ylim=c(0,210))
lines(procter$Date[330:335], procter$StockPrice[330:335])
lines(boeing$Date[330:335], boeing$StockPrice[330:335], col='green')
lines(ibm$Date[330:335], ibm$StockPrice[330:335], col='blue')
lines(ge$Date[330:335], ge$StockPrice[330:335], col='purple')
# Answers: P&G, Boeing

# Problem 3.4 - Visualizing Stock Dynamics 1995-2005
# In the last two years of this time period (2004 and 2005) which stock seems to
# be performing the best, in terms of increasing stock price?
# Answer: Boeing

# Problem 4.1 - Monthly Trends
# For IBM, compare the monthly averages to the overall average stock price. In which
# months has IBM historically had a higher stock price (on average)? Select all that apply
tapply(ibm$StockPrice, months(ibm$Date), mean)

# Problem 4.2 - Monthly Trends
# General Electric and Coca-Cola both have their highest average stock price in the same month. Which month is this?
tapply(cc$StockPrice, months(cc$Date), mean) #We just need to run one of them since we already know it's the same month

# Problem 4.3 - Monthly Trends
# For the months of December and January, every company's average stock is higher
# in one month and lower in the other. In which month are the stock prices lower?
# Answer: December

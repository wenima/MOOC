# commands to follow the lecture Unit 1: Understanding Food
# set working directory:
setwd('~/github/MOOC/MIT/15.071/Week1/data/')

#read data from file into a dataframe(df)
USDA = read.csv("USDA.csv")

# display the (str)ucture of the df
str(USDA)

# display a summary of the df
summary(USDA)

# find the highest value for Sodium
which.max(USDA$Sodium)

# find the food item belonging to the highest value
USDA$Description[which.max(USDA$Sodium)]

# create a subset of food items which have a Sodium level higher than 10000
hs = subset(USDA, Sodium > 10000)

# get number of items in subset
nrow(hs)

# find Sodium level for Cavia
USDA$Sodium[match("CAVIAR", USDA$Description)]

# get standard deviation for Sodium ignoring NAs
sd(USDA$Sodium, na.rm=TRUE)

# simple plot x-axis / y-axis
plot(USDA$Protein, USDA$TotalFat)

# simple boxplot with label on y axis
boxplot(USDA$Sugar, main = 'Boxplot of Sugar Levels', ylab = 'Sugar in (g)')

# add a new variable of type numeric to df for all food items that have a
# higher level of Sodium, Protein, TotalFat and Carbohydrates than avg
USDA$HigherThanAverageSodium = as.numeric(USDA$Sodium > mean(USDA$Sodium, na.rm=TRUE))
USDA$HigherThanAverageProtein = as.numeric(USDA$Protein > mean(USDA$Protein, na.rm=TRUE))
USDA$HigherThanAverageTotalFat = as.numeric(USDA$TotalFat > mean(USDA$TotalFat, na.rm=TRUE))
USDA$HigherThanAverageCarbohydrate = as.numeric(USDA$Carbohydrate > mean(USDA$Carbohydrate, na.rm=TRUE))

# create a table based on 2 variables, 1 means high in both
table(USDA$HigherThanAverageSodium, USDA$HigherThanAverageTotalFat)

# Get avg amt of iron, sorted by high and low protein
# tapply(arg1, arg2, arg3) - Group argument 1 by argument 2 and apply argument 3 (to arg1)
tapply(USDA$Iron, USDA$HigherThanAverageProtein, mean, na.rm=TRUE)

# Get max level if vitamin C in foods with high and low carbs?
tapply(USDA$VitaminC, USDA$HigherThanAverageCarbohydrate, max, na.rm=TRUE)

# Do foods high in carbs generally have higher VitaminC levels?
tapply(USDA$VitaminC, USDA$HigherThanAverageCarbohydrate, summary, na.rm=TRUE)

# Crime is an international concern, but it is documented and handled in very
# different ways in different countries. In the United States, violent crimes
# and property crimes are recorded by the Federal Bureau of Investigation (FBI).
# Additionally, each city documents crime, and some cities release data regarding
# crime rates. The city of Chicago, Illinois releases crime data from 2001 onward online.

# load data into a dataframe
mvt = read.csv("mvtWeek1.csv")

# get the first entry for Dates variable
mvt$Date[1]

# convert a date into a date object
DateConvert = as.Date(strptime(mvt$Date, "%m/%d/%y %H:%M"))

# in which month did the fewest motor vehicle thefts occur?
table(mvt$Month)

# on which weekday did the most motor vehicle thefts occur?
table(mvt$Weekday)

# Which month has the largest number of motor vehicle thefts for which an arrest was made?
table(mvt$Month, mvt$Arrest)

# Does it look like there were more crimes for which arrests were made in the
# first half of the time period or the second half of the time period?
# (Note that the time period is from 2001 to 2012, so the middle of the time
# period is the beginning of 2007.)
boxplot(mvt$Date ~ mvt$Arrest, xlab="", ylab="Arrests", main="Arrests over Time")

# For what proportion of motor vehicle thefts in 2001 was an arrest made?
# first, subset the data for only the observations you are interested in
mvt2001 = subset(mvt, Year == 2001)
# use the table() function to split the data between TRUE and FALSE
t = table(mvt2001$Arrest)
# calculate the percentage of TRUE column of total number of Arrests in df mvt2001
2152 / 20669 # == 0.1041173

# For what proportion of motor vehicle thefts in 2007 was an arrest made?
# same technique as above
1212 / 14280 # == 0.08487395

# For what proportion of motor vehicle thefts in 2012 was an arrest made?
# same technique as above but since the dataset ends in 2012, alot of cases may
# still be under investigation which explains the low number
550 / 14092 # == 0.03902924

# Which locations are the top five locations for motor vehicle thefts, excluding
# the "Other" category? You should select 5 of the following options.
tail(sort(table(mvt$LocationDescription)), 6)

# Create a subset of your data, only taking observations for which the theft
# happened in one of these five locations, and call this new data set "Top5.
# How many observations are in Top5?
# Since one of the locations is "Other" which should not be included, we use
# the command from previous solution and store it into top6
top6 = tail(sort(table(mvt$LocationDescription)), 6)
# now we remove the element "Other". Since the dataset is small, we can just remove
# "Other" by indexing it.
top5 <- top5[-4]
# Now we just get the summary to get the total observations
summary(bottom5) # == Number of cases in table: 177510

# One of the locations has a much higher arrest rate than the other locations.
# Which is it?

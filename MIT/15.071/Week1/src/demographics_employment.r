# Demographics and Employment in the United States
#
# In the wake of the Great Recession of 2009, there has been a good deal of focus
# on employment statistics, one of the most important metrics policymakers use to
# gauge the overall strength of the economy. In the United States, the government
# measures unemployment using the Current Population Survey (CPS), which collects
# demographic and employment information from a wide range of Americans each month.
# In this exercise, we will employ the topics reviewed in the lectures as well as
# a few new techniques using the September 2013 version of this rich, nationally
# representative dataset.

# Problem 1.1 - Loading and Summarizing the Dataset
# How many interviewees are in the dataset?
cps = read.csv("CPSData.csv")

# Problem 1.2 - Loading and Summarizing the Dataset
# Among the interviewees with a value reported for the Industry variable, what is
# the most common industry of employment?
cps$Industry[which.max(cps$Industry)]

# Problem 1.3 - Loading and Summarizing the Dataset
# Which state has the fewest interviewees?
head(sort(table(cps$State)), 1)
# Which state has the most interviewees?
tail(sort(table(cps$State)), 1)

# Problem 1.4 - Loading and Summarizing the Dataset
# What proportion of interviewees are citizens of the United States?
1 - (7590 / 131302)

# Problem 1.5 - Loading and Summarizing the Dataset
# For which races are there at least 250 interviewees in the CPS dataset of Hispanic ethnicity?
table(cps$Hispanic, cps$Race)

# Problem 2.1 - Evaluating Missing Values
# Which variables have at least one interviewee with a missing (NA) value? (Select all that apply.)
summary(cps)

# Problem 2.2 - Evaluating Missing Values
# Which is the most accurate
# Answer: The Married variable being missing is related to the Age value for the interviewee

# Problem 2.3 - Evaluating Missing Values
# How many states had all interviewees living in a non-metropolitan area (aka they
# have a missing MetroAreaCode value)? For this question, treat the District of
# Columbia as a state (even though it is not technically a state).
table(cps$State, is.na(cps$MetroAreaCode))
# How many states had all interviewees living in a metropolitan area? Again, treat the District of Columbia as a state

# Problem 2.4 - Evaluating Missing Values
# Which region of the United States has the largest proportion of interviewees living in a non-metropolitan area?
# subset to filter on all interviewees with no area code
non_metro = subset(cps, is.na(cps$MetroAreaCode))
# for small dataset, we now can simply do
table(non_metro$Region)
# to get the answer; for larger datasets, the answer for 2.5 is better

# Problem 2.5 - Evaluating Missing Values
# Which state has a proportion of interviewees living in a non-metropolitan area closest to 30%?
# Which state has the largest proportion of non-metropolitan interviewees,
# ignoring states where all interviewees were non-metropolitan?
head(sort(tapply(is.na(cps$MetroAreaCode), cps$State, mean)), 30)

# Problem 3.1 - Integrating Metropolitan Area Data
# Read these two dictionaries into data frames MetroAreaMap and CountryMap.
# How many observations (codes for metropolitan areas) are there in MetroAreaMap?
# How many observations (codes for countries) are there in CountryMap?
cm = read.csv("CountryCodes.csv")
metro = read.csv("MetroAreaCodes.csv")
str(metro)
str(cm)

# Problem 3.2 - Integrating Metropolitan Area Data
# What is the name of the variable that was added to the data frame by the merge() operation?
str(cps)
# How many interviewees have a missing value for the new metropolitan area variable?
# Note that all of these interviewees would have been removed from the merged data
# frame if we did not include the all.x=TRUE parameter.
summary(cps)

# Problem 3.3 - Integrating Metropolitan Area Data
# Which of the following metropolitan areas has the largest number of interviewees?
tmp = subset(cps, MetroArea %in% c("Atlanta-Sandy Springs-Marietta, GA",
"Baltimore-Towson, MD", "Boston-Cambridge-Quincy, MA-NH", "San Francisco-Oakland-Fremont, CA"))
summary(tmp)

# Problem 3.4 - Integrating Metropolitan Area Data
# Which metropolitan area has the highest proportion of interviewees of Hispanic ethnicity?
tail(sort(tapply(cps$Hispanic, cps$MetroArea, mean, na.rm=TRUE)), 1)

# Problem 3.5 - Integrating Metropolitan Area Data
# Determine the number of metropolitan areas in the United States from which at
# least 20% of interviewees are Asian.
tail(sort(tapply(cps$Race == "Asian" , cps$MetroArea, mean, na.rm=TRUE)), 5)

# Problem 3.6 - Integrating Metropolitan Area Data
# Which metropolitan area has the smallest proportion of interviewees who have
# received no high school diploma
head(sort(tapply(cps$Education == "No high school diploma" , cps$MetroArea, mean, na.rm=TRUE)), 1)

# Problem 4.1 - Integrating Country of Birth Data
# Merge in CountryCodes
cps = merge(cps, cm, by.x="CountryOfBirthCode", by.y="Country", all.x=TRUE)
# What is the name of the variable added to the CPS data frame by this merge operation?
str(cps)
# How many interviewees have a missing value for the new country of birth variable?
summary(cps)

# Problem 4.2 - Integrating Country of Birth Data
# Among all interviewees born outside of North America, which country was the most common place of birth?
summary(cps)

# Problem 4.3 - Integrating Country of Birth Data
# What proportion of the interviewees from the "New York-Northern New Jersey-Long Island, NY-NJ-PA"
# metropolitan area have a country of birth that is not the United States? For this
# computation, don't include people from this metropolitan area who have a missing country of birth.
ny = subset(cps, MetroArea == "New York-Northern New Jersey-Long Island, NY-NJ-PA")
ny$MetroArea = factor(ny$MetroArea)
1 - tapply(ny$Country == "United States" , ny$MetroArea, mean, na.rm=TRUE)

# Problem 4.4 - Integrating Country of Birth Data
# Which metropolitan area has the largest number (note -- not proportion) of interviewees
# with a country of birth in India?
indian = subset(cps, Country == "India")
str(indian)
# Brazil?
brazil = subset(cps, Country == "Brazil")
str(brazil)
# Somalia?
somalia = subset(cps, Country == "Somalia")
str(somalia)

# Exercise: Exercise 1
# Name: Gough, Ryan
# Date: 2020-09-13

## Check your current working directory using `getwd()`
getwd()

## List the contents of the working directory with the `dir()` function
dir()

## If the current directory does not contain the `data` directory, set the
## working directory to project root folder (the folder should contain the `data` directory
## Use `setwd()` if needed

setwd("/Users/ryangough/Documents/GitHub/dsc520")
dir()

## Read the file `data/scores.csv` to `the_scores`
the_scores <- read.csv("data/scores.csv")
colnames(the_scores) <- c("Count", "Score", "Section")
summary(the_scores)

# 1. What are the observational units in this study?
# A1. The observational units are the students in the class.

# 2. Identify the variables mentioned in the narrative paragraph and determine which are categorical and quantitative?
# The variables are; "Count", "Score", and "Section".

# 3. Create one variable to hold a subset of your data set that contains only the Regular Section and one variable for the Sports Section.
sports <- subset(the_scores, Section == "Sports")
sports
summary(sports)

regular <- subset(the_scores, Section == "Regular")
regular
summary(regular)

ggplot() + 
  geom_point(data=sports, aes(Score, Count, group=Section, color= "Sports")) +
  geom_point(data=regular, aes(Score, Count, group=Section, color= "Regular")) +
  geom_smooth(data=sports, method = "lm", aes(Score, Count, group=Section, color= "Sports")) +
  geom_smooth(data=regular, method = "lm", aes(Score, Count, group=Section, color= "Regular")) +
  xlim(200, 400) +
  labs(colour= "Section") +
  ggtitle("Scatterplot of Grades by Section") 

#a. Comparing and contrasting the point distributions between the two section, looking at both tendency and consistency: Can you say that one section tended to score more points than the other? Justify and explain your answer.

# b. Did every student in one section score more points than every student in the other section? If not, explain what a statistical tendency means in this context.

# c. What could be one additional variable that was not mentioned in the narrative that could be influencing the point distributions between the two sections?

                                                           
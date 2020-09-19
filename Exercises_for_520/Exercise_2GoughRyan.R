# Assignment: Exercise 2
# Name: Gough, Ryan
# Date: 2020-09-15

## Load the ggplot2 package
library(ggplot2)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/ryangough/Documents/Github/dsc520")

## Load the "data/acs-14-1yr-s0201.csv" to
survey_2014 <- read.csv("data/acs-14-1yr-s0201.csv")

xx# 1. What are the elements in your data (including the categories and data types)?

# A.1) The elements in my dataset are made of multiple data types. 
        names(survey_2014)
        summary(survey_2014)
        lapply(survey_2014, class)
        
        # Id: Nominal Variable, Integer
        # Id2: Nominal Variable, Integer
        # Geography: Nominal Variable, Character
        # PopGroupID: Ordinal Variable, Integer
        # POPGROUP.display.label: Nominal Variable, Character
        # RacesReported: Ratio Variable, Integer
        # HSDegree: Ratio Variable, Numeric
        # BachDegree: Ratio Variable, Numeric
        
# 2. Please provide the output from the following functions: str(); nrow(); ncol()

# 2.A) 
str(survey_2014)
nrow(survey_2014)
ncol(survey_2014)

# 3. Create a Histogram of the HSDegree variable using the ggplot2 package.

      # a. Set a bin size for the Histogram.

      # b. Include a Title and appropriate X/Y axis labels on your Histogram Plot.

ggplot(survey_2014, aes(x=HSDegree,)) + 
  geom_histogram(bins = 20) +
  ggtitle("Histogram of High School Degree") +
  xlab("% of High School Degree Achivement") +
  ylab("Frequency")

# 4. Answer the following questions based on the Histogram produced:

  # a. Based on what you see in this histogram, is the data distribution unimodal?
    #a.1: The distribution of the data is unimodal, as it only has one peak.
  
  # b. Is it approximately symmetrical?
    #b.1: It is not approximately symmetrical, it is skewed to the left, indicating it is negatively skewed.
  
  # c. Is it approximately bell-shaped?
    #c.1: No, the distribtion of the data is not evenly distributed, causing it to be skewed to the left.
  
  # d. Is it approximately normal?
    #d.1: No, a left leaning skew indicates that the mean of the dataset is atypical of the range causing it to be left of the peak.
  
  # e. If not normal, is the distribution skewed? If so, in which direction?
    #e.1: It is skewed to the left. 
  
  # f. Include a normal curve to the Histogram that you plotted.
    #f.1: 
ggplot(survey_2014, aes(x=HSDegree,)) + 
  geom_histogram(binwidth=2, colour="black", 
                 aes(y=..density.., fill=..count..)) +
  scale_fill_gradient("Count", low="#DCDCDC", high="#7C7C7C") +
  stat_function(fun=dnorm,
                         color="red",
                         args=list(mean=mean(survey_2014$HSDegree), 
                                   sd=sd(survey_2014$HSDegree))) +
  ggtitle("Histogram of High School Degree") +
  xlab("% of High School Degree Achivement") +
  ylab("Frequency")

  # g. Explain whether a normal distribution can accurately be used as a model for this data.
    #g.1: No, the distribution of the data on the histogram does not illustrate a normal graph.
      # The characteristics of a normal distribution are:
      # Symmetric: False
      # Unimodal: True
      # Mean, Median, and Mode are Equal: False
    # For these reasons the data is positively skewed to the left, indicating a non-normal distribution of the data. 

# 7. Now that you have looked at this data visually for normality, you will now quantify normality with numbers using the stat.desc() function. Include a screen capture of the results produced.

stat.desc(survey_2014)
stat.desc(survey_2014$HSDegree, basic=FALSE, norm=TRUE)

# 8. In several sentences provide an explanation of the result produced for:
  #skew, kurtosis, and z-scores. 
#In addition, explain how a change in the sample size may change your explanation?

  #8.1: The skew for the histogram is -1.67~. This indicates a negatively skew distribution of data. 
  # Additionally the kurtosis of the graph is 4.35, indicating a non-normal distribution of data. In analyzing the graph we can assess that for a normal distribution of data scores of Kurtosis and Skew should be 0 or roughly zero.
  # The fact that our Skew and Kurtosis is not 0 indicates confirms our visual observations of the data.
  # A skew.2se of -4.03~ and a kurt.2se of 5.27~ are Z score indications that the data obtained have values of skew and kurtosis as or more extreme than this by chance by 5%.
  # In increasing the sample size, I do not believe that we would see a change in the distribution of the graph. The graph itself reflects High school achievement in reporting counties. Adding more samples would only confirm this trend. 
  # Statistics is an important tool, but a tool nonetheless. In the year 2020, we can expect that all/ if not most reporting counties would yield high school achievement near 100% Likewise, this would cover many counties. Our expectation of the graph with more data would only confirm this. 
  # What we would want would more data with less variance, ideally no outliers that would cause the graph to skew. 
  # Given the removal of outliers and data points lining up with our expectation, we can expect to see a more evenly distributed graph. 
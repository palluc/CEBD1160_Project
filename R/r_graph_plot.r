install.packages("RCurl")
library(RCurl) 

# Read in dataset from GITHUB URL Dataset subfolder
dat <- read.csv("https://raw.githubusercontent.com/palluc/CEBD1160_Project/master/Dataset/Nutrition_Physical_Activity_and_Obesity_Behavioral_Risk_Factor_Surveillance_System.csv")



# -----------------------------------------------------------
# Prepare dataset for graph #1: Select all totals in the data
# -----------------------------------------------------------

dsngraph1 <- subset(dat, dat$Topic=="Obesity / Weight Status" & dat$StratificationCategory1=="Total" & dat$YearStart=="2015",  select=YearStart:StratificationCategory1)


# -----------------------------------------------------------
# Prepare dataset for graph #2: select all totals in the data
# -----------------------------------------------------------


dsngraph2 <- subset(dat, dat$Topic=="Obesity / Weight Status" & dat$StratificationCategory1=="Total" & dat$Question=="Percent of adults aged 18 years and older who have obesity",  select=YearStart:StratificationCategory1)


# -----------------------------------------------------------
# Prepare dataset for graph #3: select all totals in the data
# -----------------------------------------------------------

newdata <- dat[which(dat$LocationAbbr=="CT" |  dat$LocationAbbr=="ME" | dat$LocationAbbr=="MA" | dat$LocationAbbr=="NH" | dat$LocationAbbr=="RI" | dat$LocationAbbr=="VT"), ]


dsngraph3 <- subset(newdata, newdata$Topic=="Obesity / Weight Status" & newdata$StratificationCategory1=="Total", select=YearStart:StratificationCategory1)


#define a vector array to list all possible values in Data_Value column - used to get max value in y-axis limits (ylim option in plot function)

yvalues <- dsngraph3$Data_Value



# -----------------
# Graph #1
# -----------------

# Set and get the working directory
setwd("C:/Users/Luciana/CEBD1160/CEBD1160_Project/R")
getwd()

# define variables
ymin <-  0.0
ymax <- 20.0

vector <- dsngraph1[,"Data_Value"]
bin_width <- 1
vector_rounded <-  bin_width * ( floor(vector/bin_width) + 0.5 )


# Plot graph #1 with the frequency distribution histogram of Percent of adults aged >= 18 yrs who have obesity/overweight classification for Year=2015

#open graphics device
png("r_graph1.png")

hist(vector_rounded, freq=TRUE, col = "blue", 
              xlim = range(19.0, 40.0), lwd=2,
              ylim=c(ymin, ymax),
              xticks <- seq(19.0, 40.0, .5),
              breaks = seq(19.0, 40.0, by=0.5),
              main = "Percentage Frequency of Weight Status in Adults for Year 2015",
              xlab = "% of adults aged >=18 years who have overweight/obesity",
              ylab = "Frequency Distribution",
              plot=TRUE)
#close graphics device
dev.off()


# -----------------
# Graph #2
# -----------------

# define variables

dsn2Avg <- aggregate(dsngraph2,list(dsngraph2$YearStart), mean)
yvalues2 <- dsn2Avg$Data_Value


# Plot graph #2 with the average distribution histogram of Percent of adults aged >= 18 yrs who have obesity/overweight classification [2011:2015]

#open graphics device
png("r_graph2.png")

plot(dsn2Avg$YearStart, dsn2Avg$Data_Value,
     xlab = "Year", ylab = "Average Percent Distribution",
     xlim=c(2010,2016), ylim=c(10,max(yvalues2)+10),   
     type="h",
     main = "Average Percentage Weight Status in Adults per Year", 
     col="blue")


#close graphics device
dev.off()


# -----------------
# Graph #3
# -----------------

# Plot graph #3 with the two variables (Year vs Value) for New England States
# open graphics device
png("r_graph3.png")

plot(dsngraph3$YearStart, dsngraph3$Data_Value,
     xlab = "Year", ylab = "(%) Percentage of Adults",
     xlim=c(2010,2016), ylim=c(10,max(yvalues)+10),   pch=c(1,2,3,4,5,6),
     main = "% Obesity/Weight Status in Adults for New England States by Year", 
     col=c("red","green","blue","cyan","yellow","purple")   )

legend("topright", inset=.05, col=c("red","green","blue","cyan","yellow","purple"), c("CT","ME","MA","NH","RI","VT"), fill=terrain.colors(6), horiz=TRUE)

# close graphics device
dev.off()

 












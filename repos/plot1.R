## Exploratory Data Analysis Course Project 2, Plot 1
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

setwd("/Users/fr2259/Coursera/ExploratoryDataAnalysis/CourseProject2/exdata-data-NEI_data/")

# Read in the data from the appropriate directory
NEI <- readRDS("summarySCC_PM25.rds")             # National Emissions Inventory
SCC <- readRDS("Source_Classification_Code.rds")  # The names of the sources



annualEmmisionSums <- aggregate(Emissions ~ year, data=NEI, sum)  # get the sum of emmissions for each year
png("plot1.png", width=480, height=480)
plot(annualEmmisionSums$year, annualEmmisionSums$Emissions, xlab="Year", ylab="Total PM2.5 Emissions", 
     main="Total PM2.5 Emissions During Select Years")
dev.off()
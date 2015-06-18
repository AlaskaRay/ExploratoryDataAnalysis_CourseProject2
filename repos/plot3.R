## Exploratory Data Analysis Course Project 2, Plot 3
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
# variable, which of these four sources have seen decreases in emissions from 1999–2008 
# for Baltimore City? Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

# Read in the data from the appropriate directory
NEI <- readRDS("summarySCC_PM25.rds")             # National Emissions Inventory
SCC <- readRDS("Source_Classification_Code.rds")  # The names of the sources

library(ggplot2)

baltimore$type <- factor(baltimore$type, 
                         labels=c("POINT", "NONPOINT", "ON-ROAD", "NON-ROAD"))

# qplot of emissions grouped by type
png("plot3.png", width=480, height=480)
qplot(year, Emissions, data=baltimore, shape=type, color=type, fill=type, 
      facets=type~year, main="Emissions by Type for Baltimore")
dev.off()
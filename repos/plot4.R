## Exploratory Data Analysis Course Project 2, Plot 4
# Across the United States, how have emissions from coal combustion-related sources 
# changed from 1999–2008?
library(ggplot2)

# Read in the data from the appropriate directory
NEI <- readRDS("summarySCC_PM25.rds")             # National Emissions Inventory
SCC <- readRDS("Source_Classification_Code.rds")  # The names of the sources

# merge NEI and SCC by the values in the "SCC" column of the NEI data frame
mergedData <- merge(NEI, SCC, by="SCC")

# find all instances of "coal", storing the results in a new variable
coal <- mergedData[grepl("coal", mergedData$Short.Name, ignore.case=TRUE),]
totalCoal <- aggregate(Emissions ~ year, data=coal, sum)
# plot results
png("plot4.png", width=480, height=480)
qplot(year, Emissions, data=totalCoal)
ggplot(coal, aes(year, Emissions)) + geom_point(color="black")
dev.off()
## Exploratory Data Analysis Course Project 2, Plot 5
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
library(ggplot2)

# Read in the data from the appropriate directory
NEI <- readRDS("summarySCC_PM25.rds")             # National Emissions Inventory
SCC <- readRDS("Source_Classification_Code.rds")  # The names of the sources

# isolate emissions sources from auotmobiles in Baltimore
baltimore <- NEI[NEI$fips == "24510",]
autos <- aggregate(Emissions ~ year, data=baltimore[grepl("ON-ROAD", baltimore$type),], sum)

png("plot5.png", width=480, height=480)
ggplot(autos, aes(year, Emissions)) + geom_bar(stat = "identity") + 
  ggtitle("Motor Vehicle Emissions for Baltimore City During Select Years")
dev.off()
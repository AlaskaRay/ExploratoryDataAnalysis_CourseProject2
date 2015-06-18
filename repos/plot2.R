## Exploratory Data Analysis Course Project 2, Plot 2
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 
# to 2008? Use the base plotting system to make a plot answering this question.

# Read in the data from the appropriate directory
NEI <- readRDS("summarySCC_PM25.rds")             # National Emissions Inventory
SCC <- readRDS("Source_Classification_Code.rds")  # The names of the sources

# Subset data for Baltimore
baltimore <- NEI[NEI$fips == "24510",]
baltiSums <- aggregate(Emissions ~ year, data=baltimore, sum)
png("plot2.png", width=480, height=480)
plot(baltiSums$year, baltiSums$Emissions, xlab="Year", ylab="Total PM2.5 Emissions", 
     main="Total PM2.5 Emissions in Baltimore During Select Years")
dev.off()


## Exploratory Data Analysis Course Project 2, Plot 6
# Compare emissions from motor vehicle sources in Baltimore City with emissions from 
# motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?
library(ggplot2)

# Read in the data from the appropriate directory
NEI <- readRDS("summarySCC_PM25.rds")             # National Emissions Inventory
SCC <- readRDS("Source_Classification_Code.rds")  # The names of the sources

# Subset the data by location and type. "ON-ROAD" used to represent motor vehicle 
# emissions, since I felt a littl confused about some of the other names.
baltimore <- NEI[NEI$fips == "24510",]
balAutoEm <- aggregate(Emissions ~ year, data=baltimore[grepl("ON-ROAD", baltimore$type),], sum)
lac <- NEI[NEI$fips == "06037",]
lacAutoEm <- aggregate(Emissions ~ year, data=lac[grepl("ON-ROAD", lac$type),], sum)

# Combine the subsets into one matrix and add the location names. 
# Adding the names here makes it easier to use them as facet labels in ggplot.
baltAndlac <- rbind(balAutoEm, lacAutoEm)
baltAndlac["locale"] <- c("Baltimore", "Baltimore", "Baltimore", "Baltimore", 
                          "LA County", "LA County", "LA County", "LA County")


# Plot motor vehicle emission totals for each place during each year.
# This gives you a picture of how much raw emissions each city produced, 
# but not exactly by how much each total changed between the years measured.
ggplot(baltAndlac, aes(year, Emissions)) + geom_bar(stat = "identity") + 
  facet_grid(. ~ locale) + 
  ggtitle("Motor Vehicle Emissions in Baltimore and LA")

# Calculate the changes in (differences between) motor vehicle emmisions from one year to the next.
diffs <- diff(baltAndlac$Emissions)
diffs=c(0,diffs)
diffs[5]=0
baltAndlac$Emissions=diffs
baltAndlac=baltAndlac[c(-1,-5),] 

# Plot changes in motor vehicle emissions
png("plot6.png", width=580, height=480)
ggplot(baltAndlac, aes(year, Emissions)) + geom_bar(stat = "identity") + 
  facet_grid(. ~ locale) + 
  ggtitle("Changes in Motor Vehicle Emissions Between Select Years in Baltimore and LA")
dev.off()
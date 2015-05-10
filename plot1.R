# Clean up workspace
rm(list=ls())
# Set working directory (where household_power_consumption.txt is located)
setwd("/Users/ernstihl/Desktop/Coursera/DataScience");
# Read in data
data <- read.table(file="household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
datamin <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
# Create plot 1 
hist(datamin$Global_active_power, main ="Global Active Power", xlab = "Global active power (kilowatts)", col ="red")
dev.copy(png, file = "plot1.png")
dev.off()
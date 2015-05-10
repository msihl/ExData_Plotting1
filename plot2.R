# Clean up workspace
rm(list=ls())
# Set working directory (where household_power_consumption.txt is located)
setwd("/Users/ernstihl/Desktop/Coursera/DataScience");
# Read in data
data <- read.table(file="household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
datamin <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
#datamin$DateTime <- as.POSIXct(paste(datamin$Date, datamin$Time), format="%Y-%m-%d %H:%M:%S")
dateTime <- strptime(paste(datamin$Date, datamin$Time), format="%d/%m/%Y %H:%M:%S")
# Create plot 2
plot(x=dateTime , y=datamin[,"Global_active_power"], type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()
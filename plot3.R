# Clean up workspace
rm(list=ls())
# Set working directory (where household_power_consumption.txt is located)
setwd("/Users/ernstihl/Desktop/Coursera/DataScience");
# Read in data
data <- read.table(file="household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
datamin <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
dateTime <- strptime(paste(datamin$Date, datamin$Time), format="%d/%m/%Y %H:%M:%S")
# Create plot 3
plot(x=dateTime, y=datamin[,"Sub_metering_1"], main="", xlab="", ylab="Energy sub metering", type="n")
with(datamin, lines(dateTime, datamin$Sub_metering_1, col = "black"))
with(datamin, lines(dateTime, datamin$Sub_metering_2, col = "red"))
with(datamin, lines(dateTime, datamin$Sub_metering_3, col = "blue"))
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png")
dev.off()
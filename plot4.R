# Clean up workspace
rm(list=ls())
# Set working directory (where household_power_consumption.txt is located)
setwd("/Users/ernstihl/Desktop/Coursera/DataScience");
# Read in data
data <- read.table(file="household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
datamin <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
dateTime <- strptime(paste(datamin$Date, datamin$Time), format="%d/%m/%Y %H:%M:%S")
# Create plots
png(filename="plot4.png")
par(mfrow = c(2, 2))
# Plot 1
plot(x=dateTime , y=datamin[,"Global_active_power"], type="l", xlab="", ylab="Global Active Power")
# Plot 2
plot(x=dateTime, y=datamin[,"Voltage"], type="l", ylab="Voltage", xlab="datetime")
# Plot 3
plot(x=dateTime, y=datamin[,"Sub_metering_1"], type="l", col ="black", ylab="Energy sub metering", xlab="")
lines(x=dateTime, y=datamin[,"Sub_metering_2"], col="red")
lines(x=dateTime, y=datamin[,"Sub_metering_3"], col="blue")
legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# Plot 4
plot(x=dateTime, y=datamin[,"Global_reactive_power"], type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()
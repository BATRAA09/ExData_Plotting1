# Abhinav Batra
# Exploratory Data Analysis Project 
# Week 1 - Plot 4

library(lubridate)
library(stringr)
library(reshape2)

hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
hpc$DateStr <- as.character(hpc$Date)
hpc$TimeStr <- as.character(hpc$Time)
hpc$Date <- as.Date(as.character(hpc$Date), "%d/%m/%Y")
hpc$Voltage <- as.numeric(as.character(hpc$Voltage))
hpc$Global_intensity <- as.numeric(as.character(hpc$Global_intensity))
hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
hpc$Global_reactive_power <- as.numeric(as.character(hpc$Global_reactive_power))
hpc$Sub_metering_1 <- as.numeric(as.character(hpc$Sub_metering_1))
hpc$Sub_metering_2 <- as.numeric(as.character(hpc$Sub_metering_2))
hpc$Sub_metering_3 <- as.numeric(as.character(hpc$Sub_metering_3))

hpc_subset <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]
hpc_melt <- melt(hpc_subset, id.vars = c("DateStr", "TimeStr"), measure.vars = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
hpc_melt$DateTime <- strptime(paste(hpc_melt$DateStr, hpc_melt$TimeStr), format = "%d/%m/%Y %H:%M:%S")
hpc_subset$DateTime <- strptime(paste(hpc_subset$DateStr, hpc_subset$TimeStr), format = "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2))
plot(hpc_subset$DateTime, hpc_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(hpc_subset$DateTime, hpc_subset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
with(hpc_melt, plot(DateTime, value, type = "n", xlab = "", ylab = "Energy sub metering"))
with(subset(hpc_melt, variable == "Sub_metering_1"), lines(DateTime, value, col = "black"))
with(subset(hpc_melt, variable == "Sub_metering_2"), lines(DateTime, value, col = "red"))
with(subset(hpc_melt, variable == "Sub_metering_3"), lines(DateTime, value, col = "blue"))
legend("topright", col = c("black", "blue", "red"), lty = c(1,1), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), inset=c(0.25, 0), y.intersp = 2)
plot(hpc_subset$DateTime, hpc_subset$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.copy(png, file = "plot4.png")
dev.off()


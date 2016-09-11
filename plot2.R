# Abhinav Batra
# Exploratory Data Analysis Project 
# Week 1 - Plot 2

library(lubridate)
library(stringr)

hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(as.character(hpc$Date), "%d/%m/%Y")
hpc$Voltage <- as.numeric(as.character(hpc$Voltage))
hpc$Global_intensity <- as.numeric(as.character(hpc$Global_intensity))
hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
hpc$Global_reactive_power <- as.numeric(as.character(hpc$Global_reactive_power))
hpc$Sub_metering_1 <- as.numeric(as.character(hpc$Sub_metering_1))
hpc$Sub_metering_2 <- as.numeric(as.character(hpc$Sub_metering_2))
hpc$Sub_metering_3 <- as.numeric(as.character(hpc$Sub_metering_3))

par(mfrow = c(1,1))
hpc_subset <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]
plot(hpc_subset$DateTime, hpc_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", height=480, width=480)
dev.off()






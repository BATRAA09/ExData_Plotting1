# Abhinav Batra
# Exploratory Data Analysis Project 
# Week 1 - Plot 1

library(dplyr)

hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
hpc$Date <- as.Date(as.character(hpc$Date), "%d/%m/%Y")
hpc$Voltage <- as.numeric(as.character(hpc$Voltage))
hpc$Global_intensity <- as.numeric(as.character(hpc$Global_intensity))
hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
hpc$Global_reactive_power <- as.numeric(as.character(hpc$Global_reactive_power))
hpc$Sub_metering_1 <- as.numeric(as.character(hpc$Sub_metering_1))
hpc$Sub_metering_2 <- as.numeric(as.character(hpc$Sub_metering_2))
hpc$Sub_metering_3 <- as.numeric(as.character(hpc$Sub_metering_3))

par(mfrow = c(1, 1))
hpc_subset <- filter(hpc, Date == "2007-02-01" | Date == "2007-02-02")
hist(hpc_subset$Global_active_power, breaks = 12, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()






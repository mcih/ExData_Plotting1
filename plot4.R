
#### plot4.R
library(lubridate)

#### READ DATA
data = read.csv(file = "household_power_consumption.txt", sep = ";")
data = data[data$Date %in% c("1/2/2007", "2/2/2007"),]
data[] = lapply(data, as.character)

#### PLOT
png(file = "plot4.png", width = 480, height = 480, bg = NA)

par(mfrow = c(2,2))

par(mar = c(4.5, 4.5, 0.5, 0.5))
plot( as.numeric(data$Global_active_power), xlab = " ", ylab = "Global Active Power",
      type = "l", axes = F, lwd = 0.5)
axis(2, at = c(0, 2, 4, 6), labels = c(0, 2, 4, 6))
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
box()

par(mar = c(4.5, 4.5, 0.5, 0.5))
plot( as.numeric(data$Voltage), xlab = "datetime", ylab = "Voltage",
      type = "l", axes = F, lwd = 0.5)
axis(2, at = c(234, 236, 238, 240, 242, 244, 246), labels = c(234, " ", 238, " ", 242, "", 246)) 
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
box()

par(mar = c(4.5, 4.5, 0.5, 0.5))
plot( as.numeric(data$Sub_metering_1), xlab = " ", ylab = "Energy sub metering",
      type = "l", axes = F, ylim = c(0, 38), lwd = 0.5)
par(new = T)
plot(as.numeric(data$Sub_metering_2), col = "red", xlab = " ",
     ylab = " ", type = "l", axes = F, ylim = c(0, 38), lwd = 0.5)
par(new = T)
plot(as.numeric(data$Sub_metering_3), col = "blue", xlab = " ",
     ylab = " ", type = "l", axes = F, ylim = c(0, 38), lwd = 0.5)
axis(2, at = c(0, 10, 20, 30), labels = c(0, 10, 20, 30))
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
box()
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lwd = 0.5, bty = "n")

par(mar = c(4.5, 4.5, 0.5, 0.5))
plot( as.numeric(data$Global_reactive_power), xlab = "datetime", ylab = "Global_reactive_power",
      type = "l", axes = F, lwd = 0.5)
axis(2, at = c(0, 0.1, 0.2, 0.3, 0.4, 0.5), labels = c(0, 0.1, 0.2, 0.3, 0.4, 0.5))
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
box()

dev.off()

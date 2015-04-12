
#### plot3.R
library(lubridate)

#### READ DATA
data = read.csv(file = "household_power_consumption.txt", sep = ";")
data = data[data$Date %in% c("1/2/2007", "2/2/2007"),]

data[] = lapply(data, as.character)

#### PLOT
png(file = "plot3.png", width = 480, height = 480, bg = NA)
plot( as.numeric(data$Sub_metering_1), xlab = " ", ylab = "Energy sub metering",
      type = "l", axes = F, xlim = c(0, 2880), ylim = c(0, 38), lwd = 0.5)
par(new = T)
plot(as.numeric(data$Sub_metering_2), col = "red", xlab = " ",
     ylab = " ", type = "l", axes = F, xlim = c(0, 2880), ylim = c(0, 38), lwd = 0.5)
par(new = T)
plot(as.numeric(data$Sub_metering_3), col = "blue", xlab = " ",
     ylab = " ", type = "l", axes = F, xlim = c(0, 2880), ylim = c(0, 38), lwd = 0.5)
axis(2, at = c(0, 10, 20, 30), labels = c(0, 10, 20, 30))
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
box()
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lwd = 0.5)
dev.off()


#### plot2.R
library(lubridate)

#### READ DATA
data = read.csv(file = "household_power_consumption.txt", sep = ";")
data = data[data$Date %in% c("1/2/2007", "2/2/2007"),]
data[] = lapply(data, as.character)

#### PLOT
png(file = "plot2.png", width = 480, height = 480, bg = NA)
plot( as.numeric(data$Global_active_power), xlab = " ", ylab = "Global Active Power (kilowatts)",
      type = "l", axes = F, lwd = 0.5)
axis(2, at = c(0, 2, 4, 6), labels = c(0, 2, 4, 6))
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
box()
dev.off()

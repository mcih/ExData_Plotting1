
#### plot1.R
library(lubridate)

#### READ DATA
data = read.csv(file = "household_power_consumption.txt", sep = ";")
data = data[data$Date %in% c("1/2/2007", "2/2/2007"),]
data[] = lapply(data, as.character)

#### PLOT
png(file = "plot1.png", width = 480, height = 480, bg = NA)
hist( as.numeric(data$Global_active_power), main = "Global Active Power",
      xlab = "Global Active Power (kilowatts)", col = "red", axes = F)
axis(2, at = c(0, 200, 400, 600, 800, 1000, 1200), labels = c(0, 200, 400, 600, 800, 1000, 1200))
axis(1, at = c(0, 2, 4, 6), labels = c(0, 2, 4, 6))
dev.off()

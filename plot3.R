# 1. Import data
data <- read.table('household_power_consumption.txt', 
                   header = TRUE, 
                   sep = ';', 
                   na.strings = "?",
                   colClasses = c(rep("character", each = 2), rep("numeric", each = 6)))

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date == as.Date('2007-02-01') | Date == as.Date('2007-02-02'))
data$DateTime <- as.POSIXct(paste(as.character(data$Date), data$Time), format="%Y-%m-%d %H:%M:%S")

# 2. Draw time series and save to PNG
png(file = "plot3.png")

with(data, plot(DateTime, 
                Sub_metering_1, 
                type = "l",
                xlab = "",
                ylab = "Energy sub metering"))

with(data, points(DateTime, Sub_metering_2, col = "red", type = "l"))
with(data, points(DateTime, Sub_metering_3, col = "blue", type = "l"))

legend("topright", 
       pch = NA,
       lty = 1,
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
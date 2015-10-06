# 1. Import data
data <- read.table('household_power_consumption.txt', 
                   header = TRUE, 
                   sep = ';', 
                   na.strings = "?",
                   colClasses = c(rep("character", each = 2), rep("numeric", each = 6)))

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date == as.Date('2007-02-01') | Date == as.Date('2007-02-02'))
# Need a datetime column for time series plots
data$DateTime <- as.POSIXct(paste(as.character(data$Date), data$Time), 
                            format="%Y-%m-%d %H:%M:%S")

# 2. Draw time series and save to PNG
png(file = "plot2.png")

with(data, plot(DateTime, 
                Global_active_power, 
                type = "l", 
                xlab = "", 
                ylab = "Global Active Power (kilowatts)"))

dev.off()
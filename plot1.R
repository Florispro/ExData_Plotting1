# 1. Import data
data <- read.table('household_power_consumption.txt', 
                   header = TRUE, 
                   sep = ';', 
                   na.strings = "?",
                   colClasses = c(rep("character", each = 2), rep("numeric", each = 6)))

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date == as.Date('2007-02-01') | Date == as.Date('2007-02-02'))

# 2. Draw histogram and save to PNG
png(file = "plot1.png")

hist(data$Global_active_power, 
     col = 'red', 
     breaks = 20, 
     main = "Global Active Power", 
     xlab = "Global active power (kilowatts)", 
     ylab = "Frequency")

dev.off()
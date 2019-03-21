# read the data from 2007 - 02 - 01 to 2007 - 02 - 02
filename = "../exdata_data_household_power_consumption/household_power_consumption.txt"
header = readLines(filename, n = 1)
header = unlist(strsplit(header,";"))
data = read.table(filename, header = FALSE, sep = ";",skip = grep("^31/1/2007;23:59", readLines(filename)), nrows = 2881)
colnames(data) = header

#convert date to day of a week
wd1 = weekdays(as.Date(data$Date, '%d/%m/%Y'))
wd = unique(wd1)
index = match(wd,wd1)

# generate the plot
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# Global Active Power plot
plot(1:nrow(data), data$Global_active_power, ylab = "Global Active Power (kilowatts)", type = "l", xaxt = 'n',xlab = "")
axis(side = 1, at = index, labels = wd)
box(lty = '1373', col = 'black')

# Voltage plot
plot(1:nrow(data), data$Voltage, ylab = "Voltage", xlab = "datetime",type = "l", xaxt = 'n')
axis(side = 1, at = index, labels = wd)
box(lty = '1373', col = 'black')

# Energy sub metering plot
plot(1:nrow(data), data$Sub_metering_1, ylab = "Energy sub metering", type = "l", xaxt = 'n', col = "black",xlab = "")
lines(1:nrow(data), data$Sub_metering_2, col = "red")
lines(1:nrow(data), data$Sub_metering_3, col = "blue")
legend("topright", legend = c(colnames(data)[7:9]), col = c("black", "red", "blue"), lty = c(1, 1, 1))
axis(side = 1, at = index, labels = wd)
box(lty = '1373', col = 'black')

# Global_reactive_power plot
plot(1:nrow(data), data$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l", xaxt = 'n')
axis(side = 1, at = index, labels = wd)
box(lty = '1373', col = 'black')


dev.off()
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
png("plot2.png", width = 480, height = 480)
plot(1:nrow(data), data$Global_active_power, ylab = "Global Active Power (kilowatts)", type = "l",xaxt = 'n',xlab = "")
axis(side = 1, at = index, labels = wd)
box(lty = '1373', col = 'black')
dev.off()
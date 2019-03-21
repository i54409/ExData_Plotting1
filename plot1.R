# read the data from 2007 - 02 - 01 to 2007 - 02 - 02
filename = "../exdata_data_household_power_consumption/household_power_consumption.txt"
header = readLines(filename, n = 1)
header = unlist(strsplit(header,";"))
data = read.table(filename, header = FALSE, sep = ";",skip = grep("^31/1/2007;23:59", readLines(filename)), nrows = 2880)
colnames(data) = header
# generate the plot
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
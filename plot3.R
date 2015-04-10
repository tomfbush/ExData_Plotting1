## plot3.R -- to recreate the third example plot

## read in the headings and then convert to character vector for adding as colnames later
headings <- read.csv('household_power_consumption.txt', sep = ";", header = FALSE, nrows=1)
headings <- unlist(headings[1,])

## read in the data, paying attention to NA string specified
data <- read.csv('household_power_consumption.txt', sep = ";", header = FALSE, skip=66637, nrows=2880, na.strings = "?")

## assign the headings to the data
colnames(data) <- headings

## Convert the dates
datetime <- paste(as.Date(data$Date,"%d/%m/%Y"), data$Time)
data$Datetime <- as.POSIXct(datetime)

## open PNG device
png(filename = "plot3.png", width = 480, height = 480)

## create the plot including the transparent background as per the example figures if required
par(bg=NA)
with(data, plot(Datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab=""))
with(data, lines(Datetime, Sub_metering_2, col = "Red"))
with(data, lines(Datetime, Sub_metering_3, col = "Blue"))
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## close PNG device
dev.off()
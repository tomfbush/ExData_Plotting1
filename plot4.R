## plot4.R -- to recreate the fourth example plot

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
png(filename = "plot4.png", width = 480, height = 480)

## use par to set the transparent background as per the example figures (if required) and also to set 2x2 matrix for multiple plots
par(bg=NA,mfrow=c(2,2))

## first plot
with(data, plot(Datetime, Global_active_power, type = "l", ylab = "Global Active Power", xlab=""))

## second plot
with(data, plot(Datetime, Voltage, type = "l", xlab="datetime"))

## third plot
with(data, plot(Datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab=""))
with(data, lines(Datetime, Sub_metering_2, col = "Red"))
with(data, lines(Datetime, Sub_metering_3, col = "Blue"))
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

## fourth plot
with(data, plot(Datetime, Global_reactive_power, type = "l", xlab = "datetime"))

## close PNG device
dev.off()
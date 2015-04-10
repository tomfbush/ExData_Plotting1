## plot2.R -- to recreate the second example plot

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
png(filename = "plot2.png", width = 480, height = 480)

## create the plot including the transparent background as per the example figures if required
par(bg=NA)
with(data, plot(Datetime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab=""))

## close PNG device
dev.off()
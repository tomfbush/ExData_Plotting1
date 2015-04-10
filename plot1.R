## plot1.R -- to recreate the first example plot

## read in the headings and then convert to character vector for adding as colnames later
headings <- read.csv('household_power_consumption.txt', sep = ";", header = FALSE, nrows=1)
headings <- unlist(headings[1,])
        
## read in the data
data <- read.csv('household_power_consumption.txt', sep = ";", header = FALSE, skip=66637, nrows=2880, na.strings = "?")

## assign the headings to the data
colnames(data) <- headings

## open PNG device
png(filename = "plot1.png", width = 480, height = 480)

## create the plot
with(data, hist(Global_active_power, col="Red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))

## close PNG device
dev.off()
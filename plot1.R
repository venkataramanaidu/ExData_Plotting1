library(lubridate)
## Read in full data. Set date and time as character for date/time
## manipulation later. Remaining variables are set as numeric.
data <- read.table("household_power_consumption.txt",
header = TRUE, sep = ";", na.strings = "?",
colClasses = c("character", "character",
"numeric", "numeric", "numeric",
"numeric", "numeric", "numeric",
"numeric"))
## Insert a new date & time variable for plotting later
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)
dataplot <- subset(data, Date == ymd("2007-02-01") |
Date == ymd("2007-02-02"))
dataplot$datetime <- dataplot$Date + dataplot$Time

## Open PNG graphics device
png(filename = "plot1.png", width = 480, height = 480,units = "px")


hist(dataplot$Global_active_power,main ="Global Active Power", xlab = "Global Active Power(kilowatts)",col = "red")

## Close graphics device
dev.off()


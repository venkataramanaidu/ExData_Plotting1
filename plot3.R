library(lubridate)
## Read in full data. Set data and time as character for date/time
## manipulation later. Remaining variables are set as numeric.


## Read the data and subset

EPC <- read.table("household_power_consumption.txt", sep=";", header=TRUE , na.strings = "?",
colClasses = c("character", "character",
"numeric", "numeric", "numeric",
"numeric", "numeric", "numeric",
"numeric"))

## Insert a new date & time variable for plotting later
EPC$Date <- dmy(EPC$Date)
EPC$Time <- hms(EPC$Time)

EPCS <- subset(EPC,Date == ymd("2007-02-01") | Date == ymd("2007-02-02"))

EPCS$datetime <- EPCS$Date + EPCS$Time

png(file ="plot3.png")
## Open PNG device; create 'plot.png' in my working directory
## Create plot and send to a file (no plot appears on screen)
## Plot in the order 1) submeter1, 2) submeter2, 3) submeter3 as specified
## in project instructions
with(EPCS, plot(datetime, Sub_metering_1, type = "l", xlab = "",
ylab = "Energy sub metering"))
with(EPCS, lines(datetime, Sub_metering_2, col = "red"))
with(EPCS, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
col = c("black", "red", "blue"), lty = "solid")
## Close graphics device
dev.off()






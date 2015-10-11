library(lubridate)
## Read in full data. Set date and time as character for date/time
## manipulation later. Remaining variables are set as numeric.

EPC <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?",
colClasses = c("character", "character",
"numeric", "numeric", "numeric",
"numeric", "numeric", "numeric",
"numeric"))

## Insert a new date & time variable for plotting later
EPC$Date <- dmy(EPC$Date)
EPC$Time <- hms(EPC$Time)

EPCS <- subset(EPC,Date == ymd("2007-02-01") | Date == ymd("2007-02-02") )
EPCS$datetime <- EPCS$Date + EPCS$Time

## coerce the column to numeric
## EPCS$Global_active_power <- as.numeric(EPCS$Global_active_power)



 png(file ="plot2.png")
## Open PNG device; create 'plot.png' in my working directory
## Create plot and send to a file (no plot appears on screen)

with (EPCS, plot(datetime, Global_active_power,lty = 1, main ="Global Active Power", ylab = "Global Active Power(kilowatts)",type ="l"))



## Annotate plot; still nothing on screen
 dev.off()
## Close the PNG file device
## Now you can view the file 'myplot.pdf' on your computer
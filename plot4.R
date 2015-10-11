library(lubridate)
## Read in full data. Set data and time as character for date/time
## manipulation later. Remaining variables are set as numeric.

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



## open the device

 png(file ="plot4.png")

## Display 4 graphs 2 by 2

par(mfrow = c(2,2))



with(EPCS, {
	plot(datetime, Global_active_power,lty = 1,  ylab = "Global Active Power(kilowatts)",type ="l")
	plot(datetime, Voltage,lty = 1,  ylab = "Voltage",type ="l")
	plot(datetime, EPCS$Sub_metering_1,lty = 1,  ylab = "Global Active Power(kilowatts)",type ="l",col ="black")
	lines(datetime,EPCS$Sub_metering_2,lty = 1,  ylab = "Global Active Power(kilowatts)",type ="l",col ="red")
	lines(datetime, EPCS$Sub_metering_3,lty = 1,  ylab = "Global Active Power(kilowatts)",type ="l",col ="blue") 
	legend("topright", pch =20,  col = c("black", "blue","red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
	plot(datetime,Global_reactive_power,lty = 1,  ylab = "Global_reactive_power",type ="l")
}
	
)
## Annotate plot; still nothing on screen
## Close the device
dev.off()
## Close the PNG file device
## Now you can view the file 'pmg4.png' on your computer
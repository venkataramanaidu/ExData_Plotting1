png(file ="plot4.png")
## Open PNG device; create 'plot.png' in my working directory
## Create plot and send to a file (no plot appears on screen)

## Read the data and subset

EPC <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
EPCS <- subset(EPC,Date == "1/2/2007" | Date == "1/1/2007" )

## coerce the column to numeric

EPCS$Sub_metering_1 <- as.numeric(EPCS$Sub_metering_1)
EPCS$Sub_metering_2 <- as.numeric(EPCS$Sub_metering_2)
EPCS$Sub_metering_3 <- as.numeric(EPCS$Sub_metering_3)
EPCS$Voltage <- as.numeric(EPCS$Voltage)
EPCS$Global_reactive_power <- as.numeric(EPCS$Global_reactive_power)

EPCS$Global_active_power <- as.numeric(EPCS$Global_active_power)

par(mfrow = c(2,2))
with(EPCS, {
	plot(EPCS$Global_active_power,lty = 1,  ylab = "Global Active Power(kilowatts)",type ="l")
	plot(EPCS$Voltage,lty = 1,  ylab = "Voltage",type ="l")
	plot(EPCS$Sub_metering_1,lty = 1,  ylab = "Global Active Power(kilowatts)",type ="l",col ="black")
	lines(EPCS$Sub_metering_2,lty = 1,  ylab = "Global Active Power(kilowatts)",type ="l",col ="red")
	lines(EPCS$Sub_metering_3,lty = 1,  ylab = "Global Active Power(kilowatts)",type ="l",col ="blue") 
	legend("topright", pch =20,  col = c("black", "blue","red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
	plot(EPCS$Global_reactive_power,lty = 1,  ylab = "Global_reactive_power",type ="l")
}
	
)
## Annotate plot; still nothing on screen
dev.off()
## Close the PNG file device
## Now you can view the file 'pmg4.png' on your computer
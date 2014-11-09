png(file ="plot3.png")
## Open PNG device; create 'plot.png' in my working directory
## Create plot and send to a file (no plot appears on screen)

## Read the data and subset

EPC <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
EPCS <- subset(EPC,Date == "1/2/2007" | Date == "1/1/2007" )

## coerce the column to numeric

EPCS$Sub_metering_1 <- as.numeric(EPCS$Sub_metering_1)
EPCS$Sub_metering_2 <- as.numeric(EPCS$Sub_metering_2)
EPCS$Sub_metering_3 <- as.numeric(EPCS$Sub_metering_3)



{
plot(EPCS$Sub_metering_1,lty = 1,  ylab = "Energy Sub Metering",type ="l",col ="black")
lines(EPCS$Sub_metering_2,lty = 1,  ylab = "Energy Sub Metering",type ="l",col ="red")
lines(EPCS$Sub_metering_3,lty = 1,  ylab = "Energy Sub Metering",type ="l",col ="blue") 
legend("topright", pch =20,  col = c("black", "blue","red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
}




## Annotate plot; still nothing on screen
dev.off()
## Close the PNG file device
## Now you can view the file 'myplot.pdf' on your computer
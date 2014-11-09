png(file ="plot1.png")
## Open PNG device; create 'plot.png' in my working directory
## Create plot and send to a file (no plot appears on screen)

## Read the data and subset

EPC <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
EPCS <- subset(EPC,Date == "1/2/2007" | Date == "1/1/2007" )

## coerce the column to numeric
EPCS$Global_active_power <- as.numeric(EPCS$Global_active_power)


hist(EPCS$Global_active_power,main ="Global Active Power", xlab = "Global Active Power(kilowatts)")



## Annotate plot; still nothing on screen
dev.off()
## Close the PNG file device
## Now you can view the file 'myplot.pdf' on your computer
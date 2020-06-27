#Load the data
datos <- "C:/Users/ELSA LOPEZ/Documents/R/Exploratory-Data-Analysis/household_power_consumption.txt"

data <- read.table(datos, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)

#plotting and saving it
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

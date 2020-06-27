#Load data
data <- read.csv("C:/Users/ELSA LOPEZ/Documents/R/Exploratory-Data-Analysis/household_power_consumption.csv", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#?as.Date
data <- subset(data, subset = (Date>='2007-02-01' & Date <= '2007-02-02'))

times <- paste(as.Date(data$Date), data$Time)
data$tiempo<- as.POSIXct(times)

#plotting the data 1 and saving it as PNG format
hist(data$Global_active_power, main='Global Active Power', xlab='Global Active Power 
     [kilowatts]', ylab = 'Frequency', col='red')

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

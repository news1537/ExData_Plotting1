require("sqldf")

mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "powerConsumption/household_power_consumption.txt"
myData <- read.csv2.sql(myFile,mySql)
myData$DateTime <- strptime(paste(myData$Date, myData$Time), "%d/%m/%Y %H:%M:%S") 
## This file read scheme is from a very helpful forum posting - 

png(filename = "plot3.png", width = 480, height = 480, pointsize = 9, bg = "white")

plot(myData$DateTime, myData$Sub_metering_1, type="l",col="black", xlab="", ylab ="Energy Sub_Metering")
par(new=TRUE)
lines(myData$DateTime, myData$Sub_metering_2, type="l", col="red")
par(new=TRUE)    
lines(myData$DateTime, myData$Sub_metering_3, type="l", col="blue")
par(new=TRUE)
legend("topright", cex =.7, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
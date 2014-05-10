require("sqldf")

mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "powerConsumption/household_power_consumption.txt"
myData <- read.csv2.sql(myFile,mySql)
myData$DateTime <- strptime(paste(myData$Date, myData$Time), "%d/%m/%Y %H:%M:%S") 
quartz()
png(filename = "plot4.png", width = 480, height = 480, pointsize = 11, bg = "white")
par(mfrow=c(2, 2))

plot(myData$DateTime, myData$Global_active_power , type="l", col="black", xlab ="", ylab = "Global Active Power")

plot(myData$DateTime, myData$Voltage, type="l", col="black", ylab ="Voltage", xlab ="datetime")

plot(myData$DateTime, myData$Sub_metering_1, type="l",col="black", xlab="", ylab ="Energy sub metering")
par(new=TRUE)
lines(myData$DateTime, myData$Sub_metering_2, type="l", col="red")
par(new=TRUE)    
lines(myData$DateTime, myData$Sub_metering_3, type="l", col="blue")
par(new=TRUE)
legend("topright", cex =.7, lty = 1, bty ="n", xjust = .75, yjust = .25, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))

plot(myData$DateTime, myData$Global_reactive_power, type="l", col="black", ylab = ("Global_reactive_power"), xlab ="datetime")
dev.off()

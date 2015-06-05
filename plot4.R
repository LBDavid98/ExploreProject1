plot4 <- function() { 
	setwd("E:/R/plots")
	library(sqldf)
	strSQL <- paste("select * from file where Date in ('1/2/2007', '2/2/2007') ",
			"AND Global_active_power NOT LIKE '?' ",
			"AND Sub_metering_1 NOT LIKE '?' ",
			"AND Sub_metering_2 NOT LIKE '?' ",
			"AND Sub_metering_3 NOT LIKE '?' ",
			"AND Voltage NOT LIKE '?' ",
			"AND Global_reactive_power NOT LIKE '?'")
		
	data <- read.csv.sql("household_power_consumption.txt", 
		sql = strSQL, header = TRUE, sep=";")
	closeAllConnections()
	data$datetime <- as.POSIXct(paste(data[,1], data[,2]), format="%d/%m/%Y %H:%M:%S")
	par(mfrow=c(2,2))
	with(data, {
		plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") 
		plot(datetime, Voltage, type="l")
		plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
			lines(datetime, Sub_metering_2, col="red")
			lines(datetime, Sub_metering_3, col="blue")
			legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))
		plot(datetime, Global_reactive_power, type="l")
	}) 
}



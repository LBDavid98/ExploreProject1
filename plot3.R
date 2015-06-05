plot3 <- function() { 
	setwd("E:/R/plots")
	library(sqldf)
	strSQL <- paste("select * from file where Date in ('1/2/2007', '2/2/2007') ",
			"AND Sub_metering_1 NOT LIKE '?'",
			"AND Sub_metering_2 NOT LIKE '?'",
			"AND Sub_metering_3 NOT LIKE '?'")
		
	data <- read.csv.sql("household_power_consumption.txt", 
		sql = strSQL, header = TRUE, sep=";")
	closeAllConnections()
	x <- as.POSIXct(paste(data[,1], data[,2]), format="%d/%m/%Y %H:%M:%S")
	a <- data[,7]
	b <- data[,8]
	c <- data[,9]
	plot(x, a, type="l", xlab="", ylab="Energy sub metering")
	lines(x, b, col="red")
	lines(x, c, col="blue")
	legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))
}

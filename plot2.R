plot2 <- function() { 
	setwd("E:/R/plots")
	library(sqldf)
	strSQL <- paste("select * from file where Date in ('1/2/2007', '2/2/2007') ",
			"AND Global_active_power NOT LIKE '?'")
		
	data <- read.csv.sql("household_power_consumption.txt", 
		sql = strSQL, header = TRUE, sep=";")
	closeAllConnections()
	x <- as.POSIXct(paste(data[,1], data[,2]), format="%d/%m/%Y %H:%M:%S")
	y <- data[,3]
	plot(x, y, type="l", xlab="", ylab="Global Active Power (kilowatts)")
}

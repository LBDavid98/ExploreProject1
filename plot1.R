plot1 <- function() { 
	setwd("E:/R/plots")
	library(sqldf)
	data <- read.csv.sql("household_power_consumption.txt", 
		sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",
		header = TRUE, sep=";")
	hist(data[,3], xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
}

setwd("C:/Users/RJR/Documents/SpiderOak Hive/School/Coursera/Data Science Certification/04 Exploratory Analysis/Week1")
library(data.table)

#Establish date variables for subsetting the data
start <- as.Date(strptime("02/01/2007","%m/%d/%Y"))
end <- as.Date(strptime("02/02/2007","%m/%d/%Y"))

#Read the data as a data.table and subset
power <- data.table(fread('household_power_consumption.txt', sep=';', header=T, na.strings="?"))
  power$Date <- as.Date(strptime(power$Date,"%d/%m/%Y"))
  power <- power[power$Date>=start & power$Date<=end,]                        

#Histogram of Global_active_power (plot 1)
png(file="plot1.png",width = 480, height = 480, units = "px")
  hist(power$Global_active_power,
       col="red",
       cex.axis=0.75,cex.main=0.8,
       xlab="Global Active Power (kilowatts)",ylab="Frequency",
       main="Global Active Power")
dev.off()




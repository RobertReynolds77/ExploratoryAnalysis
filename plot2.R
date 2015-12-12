setwd("C:/Users/RJR/Documents/SpiderOak Hive/School/Coursera/Data Science Certification/04 Exploratory Analysis/Week1")
library(data.table)

#Establish date variables for subsetting the data
start <- as.Date(strptime("02/01/2007","%m/%d/%Y"))
end <- as.Date(strptime("02/02/2007","%m/%d/%Y"))

#Read the data as a data.table and subset
power <- data.table(fread('household_power_consumption.txt', sep=';', header=T, na.strings="?"))
  power$Date <- as.Date(strptime(power$Date,"%d/%m/%Y"))
  power <- power[power$Date>=start & power$Date<=end,]                        

#Plot of Global_active_power (plot 2)
png(file="plot2.png",width = 480, height = 480, units = "px")
  plot(1:2880,power$Global_active_power,type="l",xaxt='n',
    ylab="Global Active Power (kilowatts)",cex.lab=0.9,xlab='')
  axis(1,at=c(0,1440,2880),labels=c('Thu','Fri','Sat'),cex.axis=0.9)
dev.off()




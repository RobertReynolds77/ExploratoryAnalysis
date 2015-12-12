setwd("C:/Users/RJR/Documents/SpiderOak Hive/School/Coursera/Data Science Certification/04 Exploratory Analysis/Week1")
library(data.table)

#Establish date variables for subsetting the data
start <- as.Date(strptime("02/01/2007","%m/%d/%Y"))
end <- as.Date(strptime("02/02/2007","%m/%d/%Y"))

#Read the data as a data.table and subset
power <- data.table(fread('household_power_consumption.txt', sep=';', header=T, na.strings="?"))
  power$Date <- as.Date(strptime(power$Date,"%d/%m/%Y"))
  power <- power[power$Date>=start & power$Date<=end,]                        

#Plot of Sub_metering_1-3 (plot 3)
png(file="plot4.png",width = 480, height = 480, units = "px")
  par(mfrow=c(2,2))
  plot(1:2880,power$Sub_metering_1,type="l",xaxt="n",
      ylab="Energy sub metering",cex.lab=0.9,xlab="")
  lines(1:2880,power$Sub_metering_2,col="red")
  lines(1:2880,power$Sub_metering_3,col="blue")
  axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"),cex.axis=0.9)
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
      lty=1,col=c("black","red","blue"),cex=0.9)
dev.off()




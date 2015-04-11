## Prepare the sub data
install.packages("lubridate")
library(lubridate)
powerconds <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?',colClasses=c(rep('character', 2),rep('numeric', 7)))
powerconds$DateTime <- paste(powerconds$Date, powerconds$Time)
powerconds$DateTime = as.POSIXlt(powerconds$DateTime,format="%d/%m/%Y %H:%M:%S")
powerconds$Date = NULL
powerconds$Time = NULL
powerconds <- subset(powerconds,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))
## Plot Graph
png(filename='plot3.png', width = 480, height = 480)
plot(x=(powerconds$DateTime),y=powerconds$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=(powerconds$DateTime),y=powerconds$Sub_metering_2,col="red")
lines(x=(powerconds$DateTime),y=powerconds$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2,cex=0.7)
dev.off()
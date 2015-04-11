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
png(filename='plot1.png', width = 480, height = 480)
hist(powerconds$Global_active_power, main='Global Active Power', xlab='Global Active Power (kilowatts)', col='red')
dev.off()
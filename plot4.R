# 0.- Set Directory
setwd("D:/#FORMACION/Coursera/04 - Exploratory Analysys/PA1")
Sys.setlocale(locale = "C")

# 1.- Read the data
lines <- grep('^[1-2]/2/2007', readLines('household_power_consumption.txt'))
skip <- min(lines)-1
nrow <- max(lines)-min(lines)+1
hpc <- read.table("household_power_consumption.txt",skip = skip, nrow = nrow, sep = ";", 
                  col.names = colnames(read.table("household_power_consumption.txt",nrow = 1, header = TRUE, sep=";")))

# 2.- Make the Plot
par(mfrow=c(2,2))
color=c("black","red","blue")
plot(wDays,hpc$Global_active_power,type="l", xlab="", ylab="Global Active Power")
plot(wDays,hpc$Voltage,type="l", xlab="datetime", ylab="Voltage")
plot(wDays, hpc$Sub_metering_1, type="l", col=color[1],xlab="", ylab="Energy sub metering")
lines(wDays,hpc$Sub_metering_2, type="l",col=color[2])
lines(wDays,hpc$Sub_metering_3, type="l",col=color[3])
legend('topright', names(hpc[7:9]), lty=1, col=colors)
plot(wDays,hpc$Global_reactive_power,type="l", xlab="datetime",ylab="Global_reactive_power")

# 3.- Copy to png file
dev.copy(png,"plot4.png",width = 480, height = 480)
dev.off()

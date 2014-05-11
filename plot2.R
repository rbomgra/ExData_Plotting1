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
wDays <- strptime(paste(hpc$Date,hpc$Time), format='%d/%m/%Y %H:%M:%S')
plot(wDays,hpc$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")

# 3.- Copy to png file
dev.copy(png,"plot2.png",width = 480, height = 480)
dev.off()
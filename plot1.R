# 0.- Set Directory
setwd("D:/#FORMACION/Coursera/04 - Exploratory Analysys/PA1")

# 1.- Read the data
lines <- grep('^[1-2]/2/2007', readLines('household_power_consumption.txt'))
skip <- min(lines)-1
nrow <- max(lines)-min(lines)+1
hpc <- read.table("household_power_consumption.txt",skip = skip, nrow = nrow, sep = ";", 
                  col.names = colnames(read.table("household_power_consumption.txt",nrow = 1, header = TRUE, sep=";")))

# 2.- Make the Plot
hist(hpc$Global_active_power,main="Global active power",col="red",xlab="Global active power (kilowatts)")

# 3.- Copy to png file
dev.copy(png,"plot1.png",width = 480, height = 480)
dev.off()

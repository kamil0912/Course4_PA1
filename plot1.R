## Read the whole dataset from the file "household_power_consumption.txt"
mytable <- read.table("household_power_consumption.txt", header = TRUE, sep = ";" )

mytable <- mytable[complete.cases(mytable),]

mydates <- subset(mytable, Date == "1/2/2007" | Date == "2/2/2007")

png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12)
xlabel="Global Active Power (kilowatts)"
title="Global Active Power"
hist(as.numeric(as.character(mydates$Global_active_power), breaks=12), col="red", xlab=xlabel, main=title)
dev.off()


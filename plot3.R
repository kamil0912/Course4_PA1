## Read the whole dataset from the file "household_power_consumption.txt"
apc <- read.delim("./data/household_power_consumption.txt", header = TRUE, sep = ";",
                  stringsAsFactors = FALSE )

## take the target subset as the first two days of Feb 2007
apc_ss <- subset(apc, Date %in% c("1/2/2007","2/2/2007"))

## change local language and time settings to English and US, respectively.
Sys.setlocale("LC_TIME","English_United States")

## Convert to POSIX format.
datetime <- strptime(paste(apc_ss[,1], apc_ss[,2], sep=" "), "%d/%m/%Y %H:%M:%S")

## form the dependent variable arrays
ESM1 <- as.numeric(apc_ss[,7])  # Sub_metering_1
ESM2 <- as.numeric(apc_ss[,8])  # Sub_metering_2
ESM3 <- as.numeric(apc_ss[,9])  # Sub_metering_3


## open the plotting device
png("plot3.png", width=480, height=480)

## generate the plot for Sub_metering_1
plot(datetime, ESM1, type="l", xlab="", ylab="Global Active Power (kilowatts)")
## add the plot for Sub_metering_2
lines(datetime, ESM2, type = "l", col = "red")
## add the plot for Sub_metering_3
lines(datetime, ESM3, type = "l", col = "blue")

## add the legend
legend_box = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright", lty = c(1,1), col = c("black","red","blue"), legend = legend_box)

## release the plotting device
dev.off()


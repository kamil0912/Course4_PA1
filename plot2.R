## Read the whole dataset from the file "household_power_consumption.txt"
apc <- read.delim("./data/household_power_consumption.txt", header = TRUE, sep = ";",
                  stringsAsFactors = FALSE )

## take the target subset as the first two days of Feb 2007
apc_ss <- subset(apc, Date %in% c("1/2/2007","2/2/2007"))

## change local language and time settings to English and US, respectively.
Sys.setlocale("LC_TIME","English_United States")

## Convert to POSIX format.
datetime <- strptime(paste(apc_ss[,1], apc_ss[,2], sep=" "), "%d/%m/%Y %H:%M:%S")

## form the dependent variable array
globalActivePower <- as.numeric(apc_ss[,3])

## open the plotting device
png("plot2.png", width=480, height=480)

## generate the plot
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")


## release the plotting device
dev.off()


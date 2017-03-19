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

## top left
GAP <- as.numeric(apc_ss[,3])  # Global Active Power

## top right
Voltage <- as.numeric(apc_ss[,5])  # Voltage

## bottom left
ESM1 <- as.numeric(apc_ss[,7])  # Sub_metering_1
ESM2 <- as.numeric(apc_ss[,8])  # Sub_metering_2
ESM3 <- as.numeric(apc_ss[,9])  # Sub_metering_3

## bottom right
GRP <- as.numeric(apc_ss[,4])  # Global Reactive Power


## open the plotting device
png("plot4.png", width=480, height=480)

par(mfrow = c(2,2))

## top left
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power")

## top right
plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")

## bottom left
{
 ## generate the plot for Sub_metering_1
  plot(datetime, ESM1, type = "l", xlab="", ylab="Energy sub metering")
 ## generate the plot for Sub_metering_2
  lines(datetime, ESM2, type = "l", col = "red")
 ## generate the plot for Sub_metering_3
  lines(datetime, ESM3, type = "l", col = "blue")
  
## add the legend
  legend_box = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
  legend("topright", lty = c(1,1), bty ="n", col = c("black","red","blue"), legend = legend_box)
}

## bottom right
plot(datetime, GRP, type="l", xlab="datetime", ylab="Global Reactive Power") 

## release the plotting device
dev.off()


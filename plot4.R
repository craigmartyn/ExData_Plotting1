HPC<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
        ##Reads data into HPC. Requires uncompressed data file in working directory
HPCsubset<-subset(HPC,HPC$Date %in% c("1/2/2007","2/2/2007"))
        ##Subsets only dates requires for this exercise
HPCsubset$datetime<-paste(HPCsubset$Date, HPCsubset$Time, sep=" ")
        ##Add datetime column that concatenates date and time fields (text)
HPCsubset$datetime<-strptime(HPCsubset$datetime, format="%d/%m/%Y %H:%M:%S")
        ##Converts text datetime column into date/time format
png(file="plot4.png")
        ##Open graphics device
par(mfrow=c(2,2))
        ##Plot 4 graphs in 2 rows, 2 columns
plot(HPCsubset$datetime,HPCsubset$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
        ##Plot Global Active Power time series
plot(HPCsubset$datetime,HPCsubset$Voltage,type="l",xlab="datetime",ylab="Voltage")
        ##Plot Voltage time series
plot(HPCsubset$datetime,HPCsubset$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
        ##Plot Energy sub metering type 1
lines(HPCsubset$datetime,HPCsubset$Sub_metering_2, col="red")
        ##Add Energy sub metering type 2 line
lines(HPCsubset$datetime,HPCsubset$Sub_metering_3, col="blue")
        ##Add Energy sub metering type 3 line
legend("topright",lty=1,bty="n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        ##Add legend
plot(HPCsubset$datetime,HPCsubset$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
        ##Plot Global Reactive Power time series
dev.off()
        ##Close graphics device
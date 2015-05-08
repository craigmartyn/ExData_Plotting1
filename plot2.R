HPC<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
        ##Reads data into HPC. Requires uncompressed data file in working directory
HPCsubset<-subset(HPC,HPC$Date %in% c("1/2/2007","2/2/2007"))
        ##Subsets only dates requires for this exercise
HPCsubset$datetime<-paste(HPCsubset$Date, HPCsubset$Time, sep=" ")
        ##Add datetime column that concatenates date and time fields (text)
HPCsubset$datetime<-strptime(HPCsubset$datetime, format="%d/%m/%Y %H:%M:%S")
        ##Converts text datetime column into date/time format
png(file="plot2.png")
        ##Open graphics device
plot(HPCsubset$datetime,HPCsubset$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
        ##Plot Global Active Power time series
dev.off()
        ##Close graphics device
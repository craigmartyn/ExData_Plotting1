HPC<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
        ##Reads data into HPC. Requires uncompressed data file in working directory
HPCsubset<-subset(HPC,HPC$Date %in% c("1/2/2007","2/2/2007"))
        ##Subsets only dates requires for this exercise
png(file="plot1.png")
        ##Open graphics device
hist(HPCsubset$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
        ##Plot Global Active Power histogram
dev.off()
        ##Close graphics device
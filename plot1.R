### This code will read the data from assignment of Project 1 of Exploratory Analysis Week 1

#Reading, and subsetting power consumption data
ddata <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(ddata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subdata <- subset(ddata,ddata$Date=="1/2/2007" | ddata$Date =="2/2/2007")

### Initiating the PNG file extension

dev.print(png, file = "plot1.png", width = 480, height = 480)
png(file = "plot1.png", bg = "transparent")
#calling the basic plot function
hist(as.numeric(as.character(subdata$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

# annotating graph
title(main="Global Active Power")
dev.off()




#### This code will read, plot and save the final output in .png format for the week 1 project for the Exploratory Data Analysis
#### Course at Coursera

# Reading, naming and subsetting power consumption data
ddata <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(ddata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subdata <- subset(ddata,ddata$Date=="1/2/2007" | ddata$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
subdata$Time <- strptime(subdata$Time, format="%H:%M:%S")
subdata[1:1440,"Time"] <- format(subdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subdata[1441:2880,"Time"] <- format(subdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


dev.print(png, file = "plot2.png", width = 480, height = 480)
png(file = "plot2.png", bg = "transparent")

# calling the basic plot function
plot(subdata$Time,as.numeric(as.character(subdata$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# annotating graph
title(main="Global Active Power Vs Time")
dev.off()

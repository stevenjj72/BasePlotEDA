
##Select the data, and eliminate NAs
plot2Data<-houPow[houPow$Date=="1/2/2007" | houPow$Date=="2/2/2007",]
plot2Data<-plot2Data[complete.cases(plot2Data$Time,plot2Data$Global_active_power),]

##concatonate Date and Time and store appropriately
powDay<-as.POSIXct(paste(plot2Data$Date,plot2Data$Time), format="%d/%m/%Y %H:%M:%S")

##Plot global active power as a function of time and label appropriately
plot(powDay,plot2Data$Global_active_power,type="l",ylab = "Global Active Power (kilowatts)",xlab="")

## copy to file as PNG
dev.copy(png,file="Plot2.png")

## close the graphics device
dev.off()

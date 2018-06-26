##Select the data
plot4Data<-houPow[houPow$Date=="1/2/2007" | houPow$Date=="2/2/2007",]

##concatonate Date and Time and store appropriate
headers<-colnames(plot4Data)

plot4Data<-cbind(plot4Data,as.POSIXct(paste(plot3Data$Date,plot3Data$Time), format="%d/%m/%Y %H:%M:%S"))

## add a short, easy to use name for the Date time column
colnames(plot4Data)<-c(headers,"datetime")

## remove NAs
plot4Data<-plot4Data[(complete.cases(plot4Data)),]

## Partition the plot with 2 rows and 2 columns
par(mfrow=c(2,2))

## Top left plot
with(plot4Data, plot(Global_active_power,type="l",ylab = "Global Active Power (kilowatts)",xlab=""))

## Top right plot
with(plot4Data,plot(datetime,Voltage,type="l"))

## Bottom left plot
with(plot4Data,plot(datetime,Sub_metering_1, type="l",ylab="Energy sub metering", xlab=""))
  with(plot4Data,lines(datetime,Sub_metering_2, type="l", col="red"))
  with(plot4Data,lines(datetime,Sub_metering_3, type="l", col="blue"))
  legend("topright", box.lwd = 0,lty=1, cex=.4, col=c("black","red","blue"), legend=c(colnames(plot4Data[,7:9])))

## Bottom right plot  
with(plot4Data,plot(datetime,Global_reactive_power,type="l"))

## copy to file as PNG
dev.copy(png,file="Plot4.png")

## close the graphics device
dev.off()

##Select the data
plot3Data<-houPow[houPow$Date=="1/2/2007" | houPow$Date=="2/2/2007",]

##concatonate Date and Time and store appropriate
headers<-colnames(plot3Data)

plot3Data<-cbind(plot3Data,as.POSIXct(paste(plot3Data$Date,plot3Data$Time), format="%d/%m/%Y %H:%M:%S"))

## add a short, easy to use name for the Date time column
colnames(plot3Data)<-c(headers,"DTG")

## remove NAs
plot3Data<-plot3Data[(complete.cases(plot3Data)),]


## Create the scatterplot with labels
with(plot3Data,plot(DTG,Sub_metering_1, type="l",ylab="Energy sub metering", xlab=""))
## Add lines to the scatterplot for the other two submeterings
with(plot3Data,lines(DTG,Sub_metering_2, type="l", col="red"))
with(plot3Data,lines(DTG,Sub_metering_3, type="l", col="blue"))

## Add a legend
legend("topright",lty=1, col=c("black","red","blue"), legend=c(colnames(plot3Data[,7:9])))

## copy to file as PNG
dev.copy(png,file="Plot3.png")

## close the graphics device
dev.off()

## This is the code was developed by Steve Jones for the first assignment in Exploratory Data Analysis
## Rough math for memory 2,000,000 rows X 9 columns X 8 bytes approx 144MB
## Let's check if there is enough memory to read it all in
memory.size()
## Looks good
## Read into a dataframe "howPow"; after the file name,
## the arguments allow first row to be read as column names, the ";" symbol
## to be used as the file seperator, and "?" to be set as NA
houPow<-read.table("household_power_consumption.txt", header = TRUE,sep=";",na.strings="?")

## For Plot1, we only need 2 days of data
globAct<-houPow[houPow$Date=="1/2/2007" | houPow$Date=="2/2/2007",]

## let's look only at the column of data we need and remove pesky NA's and
globAct<-na.omit(globAct$Global_active_power)

## take another look at the data
summary(globAct)
## The maximum observation is 7.482, so set sequence for breaks (bin size) from 0 to 7.5
## Using a calibrated eyeball, set other parameters in hist() to match desired outcome
## Each bin is .5 wide, the x axis has tick marks at 0,2,4 and 6, color is red, etc.
## Note that I am colorblind, so the color is best guess
##png("Plot1.png", width = 480, height = 480)
hist(globAct, breaks = seq(0,7.5,0.5),  xaxp = c(0,6,3),
     col="red", main="Global Active Power", xlab = "Global Active Power(kilowatts)")

## copy to file as PNG
dev.copy(png,file="Plot1.png")

## close the graphics device
dev.off()


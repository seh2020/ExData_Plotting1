library(dplyr)

## getting data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="~/coursera_ref/test/ExData_Plotting1/zipdata.zip")
unzip("zipdata.zip")

data <- read.table("./household_power_consumption.txt", header=T,sep=";",stringsAsFactors=F, na.strings="?")
head(data)
dim(data)
names(data)
data1 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
head(data1)
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
head(data1)
names(data1)

## Plot4
data1$Global_active_power <- as.numeric(data1$Global_active_power)
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

with(data1, plot(Voltage~Datetime, type="l",
                 ylab="Voltage", xlab="datetime"))
with(data1, plot(Global_reactive_power~Datetime, type="l",
                 ylab="Global_reactive_power", xlab="datetime"))

png("plot4.png", width=480, height=480) ##save plot4.png
par(mfrow=c(2, 2))
with(data1, plot(Global_active_power~Datetime, type="l",
                 ylab="Global Active Power (kilowatts)", xlab=""))
with(data1, plot(Voltage~Datetime, type="l",
                 ylab="Voltage", xlab="datetime"))
with(data1, {plot(Sub_metering_1~Datetime, type="l",
                  ylab="Energy sub metering", xlab="", col="Black")
  lines(Sub_metering_2~Datetime, col='Red')
  lines(Sub_metering_3~Datetime, col='Blue') })    
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", 
                "Sub_metering_3"))
with(data1, plot(Global_reactive_power~Datetime, type="l",
                 ylab="Global_reactive_power", xlab="datetime"))
dev.off()


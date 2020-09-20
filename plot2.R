library(dplyr)
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


data1$Global_active_power <- as.numeric(data1$Global_active_power)
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

## Plot2
with(data1, plot(Global_active_power~Datetime, type="l",
                 ylab="Global Active Power (kilowatts)", xlab=""))

png("plot2.png", width=480, height=480) ##save in "plot2.png"
with(data1, plot(Global_active_power~Datetime, type="l",
                 ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()




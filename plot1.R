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

## Plot1 
data1$Global_active_power <- as.numeric(data1$Global_active_power)
hist(data1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

png("plot1.png", width=480, height=480) ## save in "plot1.png"
hist(data1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()




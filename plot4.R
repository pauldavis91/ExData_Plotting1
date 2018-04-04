project_file<-"project_dataset.zip"
if(!file.exists(project_file))
{
  url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url,project_file)
}

if(!file.exists("household_power_consumption.txt"))
{
  unzip(project_file)
}

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".",na.strings="?")
subsetdata<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
voltage<-as.numeric(subsetdata$Voltage)
globalactivepower<-as.numeric(subsetdata$Global_active_power)
globalreactivepower<-as.numeric(subsetdata$Global_reactive_power)
submetering1<-as.numeric(subsetdata$Sub_metering_1)
submetering2<-as.numeric(subsetdata$Sub_metering_2)
submetering3<-as.numeric(subsetdata$Sub_metering_3)
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(datetime,globalactivepower,type="l",ylab="Global Active Power",xlab="")
plot(datetime,voltage,type="l",ylab="Voltage",xlab="datetime")
plot(datetime,submetering1,type="l",xlab="",ylab="Energy sub metering")
lines(datetime,submetering2,col="red")
lines(datetime,submetering3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2.5,col=c("black","red","blue"))
plot(datetime,globalreactivepower,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()

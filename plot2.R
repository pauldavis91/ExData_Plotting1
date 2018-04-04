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
globalactivepower <- as.numeric(subsetdata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

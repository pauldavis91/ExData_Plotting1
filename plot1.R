project_file<-"project_dataset.zip"
if(!file.exists(project_file))
{
  url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url,project_file)
}

if(!file.exists("household_power_consumption"))
{
  unzip(project_file)
}
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
subset<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
globalactivepower<-as.numeric(subset$Global_active_power)
png("Plot1.png",width = 480,height = 480)
hist(globalactivepower,col="red",main="Global Active Power",xlab = "Global Active Power (Kilowatts)")
dev.off()

## R Script to plot the first graph
## output should be Plot1.png

##load the data if it does not already exist
if(!exists("epcdata")) { 
  epcdata<-read.table("household_power_consumption.txt",header=TRUE, sep=";",na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  epcdata$Time<-strptime(paste(epcdata$Date,epcdata$Time,sep=" "),format="%d/%m/%Y %H:%M:%S", tz="")
  epcdata$Date<-as.Date(epcdata$Date, format="%d/%m/%Y")
}

#filter relevant data
epcfdata<-epcdata[(epcdata$Date>=as.Date("2007-02-01")& epcdata$Date<=as.Date("2007-02-02")),]

#plot the histogram
hist(epcfdata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (Kilowatts)")

#save as png file
dev.copy(png, file="Plot1.png",height=480, width=480 )

dev.off()
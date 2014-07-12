## R Script to plot the 3rd graph
## output should be Plot3.png

##load the data if it does not already exist
if(!exists("epcdata")) { 
  epcdata<-read.table("household_power_consumption.txt",header=TRUE, sep=";",na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  epcdata$Time<-strptime(paste(epcdata$Date,epcdata$Time,sep=" "),format="%d/%m/%Y %H:%M:%S", tz="")
  epcdata$Date<-as.Date(epcdata$Date, format="%d/%m/%Y")
}

## filter relevant data
epcfdata<-epcdata[(epcdata$Date>=as.Date("2007-02-01")& epcdata$Date<=as.Date("2007-02-02")),]

#plot the graph
with(epcfdata, plot(epcfdata$Time,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(epcfdata, points(epcfdata$Time,Sub_metering_2,type="l", col="red"))
with(epcfdata, points(epcfdata$Time,Sub_metering_3,type="l",col="blue"))

#add the legend
legend("topright","(x,y)", lty=1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

#save as png file
dev.copy(png, file="Plot3.png",height=480, width=640 )

dev.off()

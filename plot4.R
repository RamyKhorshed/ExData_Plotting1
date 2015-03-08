#powerdata<-read.table("~/Duke/Data Analysis/Coursera/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE)
newdata <- subset(powerdata, Date == "1/2/2007"| Date == "2/2/2007") 

#Active Power
ActivePower<-newdata$Global_active_power
ActivePower<-as.numeric(as.character(ActivePower))

#Voltage
Voltage<-newdata$Voltage
Voltage<-as.numeric(as.character(Voltage))

#reactive Power
reactivePower<-newdata$Global_reactive_power
reactivePower<-as.numeric(as.character(reactivePower))


#SubMetering
Sub_metering_1<-newdata$Sub_metering_1
Sub_metering_1<-as.numeric(levels(Sub_metering_1))[Sub_metering_1]

Sub_metering_2<-newdata$Sub_metering_2
Sub_metering_2<-as.numeric(levels(Sub_metering_2))[Sub_metering_2]

Sub_metering_3<-newdata$Sub_metering_3
Sub_metering_3<-as.numeric(as.character(Sub_metering_3))



#Datetime
Time<- newdata$Time
Date<- newdata$Date
datetime<- paste(Date, Time)
datetime<-strptime(datetime, format="%e/%m/%Y %H:%M:%S")

png(filename="~/Duke/Data Analysis/Coursera/plot4.png",width=480,
    height= 480,units= "px"
)
par(mfrow=c(2,2))

#plot 1
plot(datetime, ActivePower, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#plot 2
plot(datetime, Voltage, type="l", ylab="Voltage")

#plot 3
plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black",)
lines(datetime, Sub_metering_2, col="red")
lines(datetime, Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(1,1),col=c("black","red","blue"))

#plot 4
plot(datetime, reactivePower, type="l", ylab="Global_reactive_power")

dev.off()

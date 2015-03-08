#powerdata<-read.table("~/Duke/Data Analysis/Coursera/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE)
newdata <- subset(powerdata, Date == "1/2/2007"| Date == "2/2/2007") 
ActivePower<-newdata$Global_active_power
ActivePower<-as.numeric(levels(ActivePower))[ActivePower]
ActivePower<-as.numeric(as.character(ActivePower))

Time<- newdata$Time
Date<- newdata$Date
datetime<- paste(Date, Time)
datetime<-strptime(datetime, format="%e/%m/%Y %H:%M:%S")

png(filename="~/Duke/Data Analysis/Coursera/plot2.png",width=480,
    height= 480,units= "px"
)
plot(datetime, ActivePower, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

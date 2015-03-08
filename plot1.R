#powerdata<-read.table("~/Duke/Data Analysis/Coursera/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE)
newdata <- subset(powerdata, Date == "1/2/2007"| Date == "2/2/2007") 
ActivePower<-newdata$Global_active_power
ActivePower<-as.numeric(levels(ActivePower))[ActivePower]
ActivePower<-as.numeric(as.character(ActivePower))

png(filename="~/Duke/Data Analysis/Coursera/plot1.png",width=490,
    height= 490,units= "px"
)
hist(ActivePower, col="red", xlab="Global Active Power (kilowatts)", breaks=12, main="Global Active Power")
dev.off()

##read the data
data<-read.table("./household_power_consumption.txt",sep=";",header=T,na.string="?")
##subset the data
date1<-as.Date("1/2/2007","%d/%m/%Y")
date2<-as.Date("2/2/2007","%d/%m/%Y")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
subdata<-subset(data,Date>=date1 & Date<=date2)
## remove the full data
rm(data)
## convert date time
datetime <- paste(subdata$Date, subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)
##plot and save to png file
png(file="./plot 3.png",width=480, height= 480)
with(subdata, {plot( Datetime,Sub_metering_1, type="l",ylab="Energy sub metering",xlab="")
               lines(Datetime,Sub_metering_2, type="l",col="red")
               lines(Datetime,Sub_metering_3, type="l",col="blue")})
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
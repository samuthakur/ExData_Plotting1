##read the whole data
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
png(file="./plot 4.png")
par(mfrow=c(2,2))
with(subdata, {plot( Datetime,Global_active_power, type="l",ylab="Global Active Power",xlab="")
               plot(Datetime,Voltage, type="l",ylab="Voltage",xlab="datetime")
               {plot( Datetime,Sub_metering_1, type="l",ylab="Energy sub metering",xlab="")
               lines(Datetime,Sub_metering_2, type="l",col="red")
               lines(Datetime,Sub_metering_3, type="l",col="blue")}
               plot(Datetime,Global_reactive_power, type="l",ylab="Global_reactive_power",xlab="datetime")})

dev.off()
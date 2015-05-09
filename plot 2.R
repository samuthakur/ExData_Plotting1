##read the whole data
data<-read.table("./household_power_consumption.txt",sep=";",header=T,na.string="?")
##subset the data
date1<-as.Date("1/2/2007","%d/%m/%Y")
date2<-as.Date("2/2/2007","%d/%m/%Y")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
subdata<-subset(data,Date>=date1 & Date<=date2)
## remove the whole data
rm(data)
## convert date time
datetime <- paste(subdata$Date, subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)
##plot and save to png file
png(file="./plot 2.png",width=480, height= 480)
with(subdata,plot( Datetime,Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()
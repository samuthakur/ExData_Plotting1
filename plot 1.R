
##read the data
data<-read.table("./household_power_consumption.txt",sep=";",header=T,na.string="?")
##subset the data
date1<-as.Date("1/2/2007","%d/%m/%Y")
date2<-as.Date("2/2/2007","%d/%m/%Y")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
subdata<-subset(data,Date>=date1 & Date<=date2)
rm(data)
##plot histogram and save to png file
png(file= "./plot 1.png",width = 480, height = 480)
with(subdata,hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red"))
dev.off()


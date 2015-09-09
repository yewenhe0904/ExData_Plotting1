rm(list=ls())
my_data <- read.table(header= TRUE, "household_power_consumption.txt",sep = ";")
my_data$Date2 <- as.Date(my_data$Date, format= "%d/%m/%Y")
completecase <- complete.cases(my_data)
my_2d_data <- subset(my_data,Date2 >= as.Date("2007/02/01") & Date2 <= as.Date("2007/02/02") & completecase)
date_time_c<-apply(my_2d_data[c("Date","Time")],1,function(x) {paste(as.character(x[1]),as.character(x[2]),sep ="-")} )
date_time_c <- as.data.frame(date_time_c)
my_2d_data$Time2<-strptime(date_time_c[,1],format ="%d/%m/%Y-%H:%M:%S")

# mfrow

par(mfrow=c(2,2),mar=rep(4,4))
#1
plot(my_2d_data[,"Time2"],as.numeric(as.character(my_2d_data[,"Global_active_power"])),xlab="",ylab = "Global Active Power (kilowatts)",type = "n")
lines(my_2d_data[,"Time2"],as.numeric(as.character(my_2d_data[,"Global_active_power"])))
#2
plot(my_2d_data[,"Time2"],as.numeric(as.character(my_2d_data[,"Voltage"])),xlab="datetime",ylab = "Voltage",type = "n")
lines(my_2d_data[,"Time2"],as.numeric(as.character(my_2d_data[,"Voltage"])))
#3
plot(my_2d_data[,"Time2"],as.numeric(as.character(my_2d_data[,"Sub_metering_1"])),xlab="",ylab = "Energy sub metering",type = "n")
lines(my_2d_data[,"Time2"],as.numeric(as.character(my_2d_data[,"Sub_metering_1"])),col="black")
lines(my_2d_data[,"Time2"],as.numeric(as.character(my_2d_data[,"Sub_metering_2"])),col="red")
lines(my_2d_data[,"Time2"],as.numeric(as.character(my_2d_data[,"Sub_metering_3"])),col="blue")
legend("topright",lty = 1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#4
plot(my_2d_data[,"Time2"],as.numeric(as.character(my_2d_data[,"Global_reactive_power"])),ylab="Global_reactive_power",xlab="datetime",type = "n")
lines(my_2d_data[,"Time2"],as.numeric(as.character(my_2d_data[,"Global_reactive_power"])))

# Create PNG
png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2),mar=rep(3.8,4))
#1
plot(my_2d_data[,"Time2"],as.numeric(as.character(my_2d_data[,"Global_active_power"])),xlab="",ylab = "Global Active Power (kilowatts)",type = "n")
lines(my_2d_data[,"Time2"],as.numeric(as.character(my_2d_data[,"Global_active_power"])))
#2
plot(my_2d_data[,"Time2"],as.numeric(as.character(my_2d_data[,"Voltage"])),xlab="datetime",ylab = "Voltage",type = "n")
lines(my_2d_data[,"Time2"],as.numeric(as.character(my_2d_data[,"Voltage"])))
#3
plot(my_2d_data[,"Time2"],as.numeric(as.character(my_2d_data[,"Sub_metering_1"])),xlab="",ylab = "Energy sub metering",type = "n")
lines(my_2d_data[,"Time2"],as.numeric(as.character(my_2d_data[,"Sub_metering_1"])),col="black")
lines(my_2d_data[,"Time2"],as.numeric(as.character(my_2d_data[,"Sub_metering_2"])),col="red")
lines(my_2d_data[,"Time2"],as.numeric(as.character(my_2d_data[,"Sub_metering_3"])),col="blue")
legend("topright",lty = 1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#4
plot(my_2d_data[,"Time2"],as.numeric(as.character(my_2d_data[,"Global_reactive_power"])),ylab="Global_reactive_power",xlab="datetime",type = "n")
lines(my_2d_data[,"Time2"],as.numeric(as.character(my_2d_data[,"Global_reactive_power"])))
dev.off()

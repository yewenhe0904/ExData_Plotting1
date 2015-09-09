rm(list=ls())
par(mfrow=c(1,1))
my_data <- read.table(header= TRUE, "household_power_consumption.txt",sep = ";")
my_data$Date2 <- as.Date(my_data$Date, format= "%d/%m/%Y")
completecase <- complete.cases(my_data)
my_2d_data <- subset(my_data,Date2 >= as.Date("2007/02/01") & Date2 <= as.Date("2007/02/02") & completecase)
date_time_c<-apply(my_2d_data[c("Date","Time")],1,function(x) {paste(as.character(x[1]),as.character(x[2]),sep ="-")} )
date_time_c <- as.data.frame(date_time_c)
my_2d_data$Time2<-strptime(date_time_c[,1],format ="%d/%m/%Y-%H:%M:%S")
#Plot 3 lines
plot(my_2d_data[,"Time2"],as.numeric(as.character(my_2d_data[,"Sub_metering_1"])),xlab="",ylab = "Energy sub metering",type = "n")
lines(my_2d_data[,"Time2"],as.numeric(as.character(my_2d_data[,"Sub_metering_1"])),col="black")
lines(my_2d_data[,"Time2"],as.numeric(as.character(my_2d_data[,"Sub_metering_2"])),col="red")
lines(my_2d_data[,"Time2"],as.numeric(as.character(my_2d_data[,"Sub_metering_3"])),col="blue")
legend("topright",lty = 1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# to PNG
png(file="plot3.png",width=480,height=480)
plot(my_2d_data[,"Time2"],as.numeric(as.character(my_2d_data[,"Sub_metering_1"])),xlab="",ylab = "Energy sub metering",type = "n")
lines(my_2d_data[,"Time2"],as.numeric(as.character(my_2d_data[,"Sub_metering_1"])),col="black")
lines(my_2d_data[,"Time2"],as.numeric(as.character(my_2d_data[,"Sub_metering_2"])),col="red")
lines(my_2d_data[,"Time2"],as.numeric(as.character(my_2d_data[,"Sub_metering_3"])),col="blue")
legend("topright",lty = 1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
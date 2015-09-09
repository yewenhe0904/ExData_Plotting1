rm(list=ls())
par(mfrow=c(1,1))
my_data <- read.table(header= TRUE, "household_power_consumption.txt",sep = ";")
my_data$Date2 <- as.Date(my_data$Date, format= "%d/%m/%Y")
my_2d_data <- subset(my_data,Date2 >= as.Date("2007/02/01") & Date2 <= as.Date("2007/02/02") )

#Plot 1 histgram
plot_data <- as.numeric(as.character(my_2d_data[["Global_active_power"]]))
hist(plot_data,xlab = "Global Active Power (kilowatts)", ylab = "Frequency",col = "tomato3",main = "Global Active Power")
#to PNG
png(file="plot1.png",width=480,height=480)
hist(plot_data,xlab = "Global Active Power (kilowatts)", ylab = "Frequency",col = "tomato3",main = "Global Active Power")
dev.off()
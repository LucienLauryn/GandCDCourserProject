x = read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
feb1 = x[x$Date =="1/2/2007",]
feb2 = x[x$Date =="2/2/2007",]
feb = rbind(feb1,feb2)

par(mfrow = c(2,2), mar = c(4,4,0,1), oma = c(0,0,2,1))
#Plot 1
feb$Global_active_power = as.numeric(feb$Global_active_power)
y = feb$Global_active_power
plot(y, type = "n", ylab = "Global Active Power (kilowatts)", axes = FALSE, frame.plot = TRUE, xlab = NA)
lines(y)
axis(side = 2)
dat = c(0,length(y)/2,length(y))
axis(side = 1, dat, format(c("Thursday","Friday","Saturday")))

#plot 2
y = as.numeric(feb$Voltage)
plot(y, type = "n", ylab = "Voltage", axes = FALSE, frame.plot = TRUE, xlab = "datetime")
lines(y)
axis(side = 2)
dat = c(0,length(y)/2,length(y))
axis(side = 1, dat, format(c("Thursday","Friday","Saturday")))


#plot 3
sm1 = as.numeric(feb$Sub_metering_1)
sm2 = as.numeric(feb$Sub_metering_2)
sm3 = as.numeric(feb$Sub_metering_3)

plot(sm1, type = "n", ylab = "Energy sub metering", axes = FALSE, frame.plot = TRUE, 
     xlab = NA)
lines(sm1, col = "black")
lines(sm2, col = "red")
lines(sm3, col = "blue")
legend("topright",names(x[7:9]), lty = 1, col = c("black","red","blue"), lwd = 1, bty = 'n')
axis(side = 2)
dat = c(0,length(y)/2,length(y))
axis(side = 1, dat, format(c("Thursday","Friday","Saturday")))

#plot 4
y = as.numeric(feb$Global_reactive_power)
plot(y, type = "n", ylab = "Global_reactive_power", axes = FALSE, frame.plot = TRUE, xlab = "datetime")
lines(y)
axis(side = 2)
dat = c(0,length(y)/2,length(y))
axis(side = 1, dat, format(c("Thursday","Friday","Saturday")))




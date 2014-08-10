x = read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
feb1 = x[x$Date =="1/2/2007",]
feb2 = x[x$Date =="2/2/2007",]
feb = rbind(feb1,feb2)

sm1 = as.numeric(feb$Sub_metering_1)
sm2 = as.numeric(feb$Sub_metering_2)
sm3 = as.numeric(feb$Sub_metering_3)

plot(sm1, type = "n", ylab = "Energy sub metering", axes = FALSE, frame.plot = TRUE, 
  xlab = NA)
lines(sm1, col = "black")
lines(sm2, col = "red")
lines(sm3, col = "blue")
legend('topright',names(x[7:9]), lty = 1, col = c("black","red","blue"), lwd = 1, bty ='n')
axis(side = 2)
dat = c(0,length(y)/2,length(y))
axis(side = 1, dat, format(c("Thursday","Friday","Saturday")))

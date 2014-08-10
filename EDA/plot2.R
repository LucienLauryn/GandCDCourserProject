x = read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
feb1 = x[x$Date =="1/2/2007",]
feb2 = x[x$Date =="2/2/2007",]
feb = rbind(feb1,feb2)
feb$Date = as.Date(feb$Date,"%d/%m/%Y")
feb$Global_active_power = as.numeric(feb$Global_active_power)
y = feb$Global_active_power
plot(y, type = "n", ylab = "Global Active Power (kilowatts)", axes = FALSE, frame.plot = TRUE, xlab = NA)
lines(y)
axis(side = 2)
dat = c(0,length(y)/2,length(y))
axis(side = 1, dat, format(c("Thursday","Friday","Saturday")))

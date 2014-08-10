x = read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
feb1 = x[x$Date =="1/2/2007",]
feb2 = x[x$Date =="2/2/2007",]
feb = rbind(feb1,feb2)
feb$Global_active_power = as.numeric(feb$Global_active_power)
hist(feb$Global_active_power, main = "Global Active Power", xlab = "Global Active Power(kilowatts)",ylab = "Frequency", col = "red")

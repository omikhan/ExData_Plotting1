#read data 
household_power_consumption <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"),  header=T, quote="\"", sep=";", na.strings = "?", stringsAsFactors=FALSE)

#subset only those data points which are in the specified dates
household_pc <- household_power_consumption[as.Date(household_power_consumption$Date, "%d/%m/%Y") >= "2007-02-01" & as.Date(household_power_consumption$Date, "%d/%m/%Y") <= "2007-02-02",]

#combine date and time columns..
household_pc$DateTime <- as.POSIXct(paste(household_pc$Date, household_pc$Time), format="%d/%m/%Y %H:%M:%S")

#Plot 3
plot(household_pc$DateTime, household_pc$Sub_metering_1+ household_pc$Sub_metering_2+household_pc$Sub_metering_3, type="n", ylab = "Energy sub metering", xlab = "")
lines(household_pc$DateTime, household_pc$Sub_metering_1, type="l")
lines(household_pc$DateTime, household_pc$Sub_metering_2,col = "red", type="l")
lines(household_pc$DateTime, household_pc$Sub_metering_3,col = "blue", type="l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= c(1,1,1), lwd=c(2.5,2.5,2.5),col=c("black", "red","blue" ))

#write the image into png image file

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

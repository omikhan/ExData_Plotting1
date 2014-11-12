#read data 
household_power_consumption <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"),  header=T, quote="\"", sep=";", na.strings = "?", stringsAsFactors=FALSE)


#subset only those data points which are in the specified dates
household_pc <- household_power_consumption[as.Date(household_power_consumption$Date, "%d/%m/%Y") >= "2007-02-01" & as.Date(household_power_consumption$Date, "%d/%m/%Y") <= "2007-02-02",]

#combine date and time columns..
household_pc$DateTime <- as.POSIXct(paste(household_pc$Date, household_pc$Time), format="%d/%m/%Y %H:%M:%S")

#Plot 1
hist(household_pc$Global_active_power, xlab = "Global Active Power(kilowatts)",col = "red", main = "Global Active Power")

#write the image into png image file

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
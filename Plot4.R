##Reading the data file in the folder
temp <- list.files(pattern = "*.txt")

##Reading the entire dataset

power_data <- read.csv(temp, header = TRUE, sep = ";", dec = ".")

##Choosing the relevant rows from the dataset

dat <- power_data[power_data$Date %in% c("1/2/2007","2/2/2007"),]

##Storing the date and time as "POSIXlt" "POSIXt" respectively in a list

dat_time <- strptime(paste(dat$Date, dat$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

##Converting all the required dataset into numeric values 

dat$Global_active_power <- as.numeric(as.character(dat$Global_active_power))
dat$Global_reactive_power <- as.numeric(as.character(dat$Global_reactive_power))
dat$Voltage <- as.numeric(as.character(dat$Voltage))
dat$Sub_metering_1 <- as.numeric(as.character(dat$Sub_metering_1))
dat$Sub_metering_2 <- as.numeric(as.character(dat$Sub_metering_2))
dat$Sub_metering_3 <- as.numeric(as.character(dat$Sub_metering_3))

## Plotting the dataset by rows respectively

par(mfrow = c(2,2), mar= c(5,4,2,1))
plot(dat_time, dat$Global_active_power, type = "l", 
     xlab = " ", ylab = "Global Active Power (kilowatts)")
plot(dat_time, dat$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(dat_time, dat$Sub_metering_1, type = "n", xlab = " ", ylab = "Energy sub metering")
lines(dat_time, dat$Sub_metering_1)
lines(dat_time, dat$Sub_metering_2, col = "red")
lines(dat_time, dat$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(dat_time, dat$Global_reactive_power, 
     type = "l", xlab = "datetime", ylab = "Global_reactive_power")

##Copying the dataset into a PNG file
dev.copy(png, "Plot4.png")
dev.off()

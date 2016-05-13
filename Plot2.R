##Reading the data file in the folder
temp <- temp <- list.files(pattern = "*.txt")

##Reading the entire dataset

power_data <- read.csv(temp, header = TRUE, sep = ";", dec = ".")

##Choosing the relevant rows from the dataset

dat <- power_data[power_data$Date %in% c("1/2/2007","2/2/2007"),]

##Storing the date and time as "POSIXlt" "POSIXt" respectively in a list and converting
##Global_active_power into a numeric field

dat_time <- strptime(paste(dat$Date, dat$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
dat$Global_active_power <- as.numeric(as.character(dat$Global_active_power))

##Plotting Global Active Power versus Time

plot(dat_time, dat$Global_active_power, type = "l", 
     xlab = " ", ylab = "Global Active Power (kilowatts)")

##Copying the dataset into a PNG file
dev.copy(png, "Plot3.png")
dev.off()
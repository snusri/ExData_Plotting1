library(lubridate)
library(dplyr)

##Downloading and extracting the data into a new folder

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "power.zip", method = "curl")

unzip("power.zip", exdir = "./powerdata")
setwd(./powerdata)

##Reading the entire dataset

power_data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")

##Using lubridate to assign date class to Date
                       
power_data$Date <- dmy(power_data$Date)

##Choosing the relevant rows from the dataset

dat <- power_data[ grep("2007-02-01|2007-02-02", power_data$Date), 1:9]

#Assigning numeric class to Global active power
dat$Global_active_power <- as.numeric(as.character(dat$Global_active_power))

##Contructing the histogram
hist(dat$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

##Copying the dataset into a PNG file
dev.copy(png, "Plot1.png")
dev.off
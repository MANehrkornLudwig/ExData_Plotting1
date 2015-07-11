################################################################################
#
#       Data Science Specialization - Exploratory Data Analysis
#
#       Assignment 1 - plot 4
#
################################################################################

#   Please change your working directory to the folder that contains the data
    wdpath <- paste0("C:\\Users\\Ich\\Desktop\\Coursera\\",
                     "Course 4 - Exploratory Data Analysis\\",
                     "assignment 1\\exdata_data_household_power_consumption")
    setwd(wdpath)

#   read data
    data_all <- read.table("household_power_consumption.txt",
                           stringsAsFactors=FALSE,
                           na.strings="?",
                           header=TRUE, sep=";", row.names = NULL)

#   prepare data
    data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")
    data <- data_all[data_all$Date >= "2007-02-01" & 
                     data_all$Date <= "2007-02-02", ]
    data$Date_Time <- as.POSIXct(paste(data$Date, data$Time),
                                 format="%Y-%m-%d %H:%M:%S")

#   plot 4
    png(file="plot4.png", width = 480, height = 480, units = "px")
    
    par(mfrow=c(2,2))
    
    with(data,{
        
        plot(Date_Time, Global_active_power, type = "l",
             ylab = "Global Active Power", xlab="")
        plot(Date_Time, Voltage, type = "l",
             ylab = "Voltage", xlab = "datetime")
        plot(Date_Time, Sub_metering_1, type = "n",
             xlab = "",
             ylab = "Energy sub metering")
        lines(Date_Time, Sub_metering_1, col="black")
        lines(Date_Time, Sub_metering_2, col="red")
        lines(Date_Time, Sub_metering_3, col="blue")
        
        legend("topright",bty = "n", col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2",
                          "Sub_metering_3"),
               lty = c(1,1,1), )
        plot(Date_Time, Global_reactive_power, type = "l",
             xlab="datetime")
        
    })
    
    dev.off()

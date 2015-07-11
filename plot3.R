################################################################################
#
#       Data Science Specialization - Exploratory Data Analysis
#
#       Assignment 1 - plot 3
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

#   plot 3
    png(file="plot3.png", width = 480, height = 480, units = "px")
    
    plot(data$Date_Time, data$Sub_metering_1, type = "n",
         xlab = "",
         ylab = "Energy sub metering")
    with(data, lines(Date_Time, Sub_metering_1, col="black"))
    with(data, lines(Date_Time, Sub_metering_2, col="red"))
    with(data, lines(Date_Time, Sub_metering_3, col="blue"))
    
    legend("topright", col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2",
                      "Sub_metering_3"),
           lty = c(1,1,1))
    
    dev.off()

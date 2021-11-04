    file <- "household_power_consumption.txt"
    dataset <- read.table(file, sep = ";", header = T)

    dates <- dataset[dataset$Date %in% c("1/2/2007", "2/2/2007"), ]

    time <- strptime(paste(dates$Date, dates$Time), "%d/%m/%Y %H:%M:%S")
    
    metering1 <- as.numeric(dates$Sub_metering_1)
    metering2 <- as.numeric(dates$Sub_metering_2)
    metering3 <- as.numeric(dates$Sub_metering_3)
    
    png("plot3.png", width = 480, height = 480)
    
    plot(time, 
         metering1, 
         xlab = "",
         ylab = "Energy sub metering",
         type = "l")
    
    lines(time, 
          metering2, 
          col = "red", 
          type = "l")
    
    lines(time, 
          metering3, 
          col = "blue", 
          type = "l")
    
    legend("topright", 
          legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           col = c("black", "red", "blue"),
           lty = 1)
    
    dev.off()
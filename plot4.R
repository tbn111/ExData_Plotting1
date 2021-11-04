    file <- "household_power_consumption.txt"
    dataset <- read.table(file, sep = ";", header = T)

    dates <- dataset[dataset$Date %in% c("1/2/2007", "2/2/2007"), ]

    time <- strptime(paste(dates$Date, dates$Time), "%d/%m/%Y %H:%M:%S")

    metering1 <- as.numeric(dates$Sub_metering_1)
    metering2 <- as.numeric(dates$Sub_metering_2)
    metering3 <- as.numeric(dates$Sub_metering_3)
    
    active_power <- as.numeric(dates$Global_active_power)
    reactive_power <- as.numeric(dates$Global_reactive_power)
    volt <- as.numeric(dates$Voltage)
    
    png("plot4.png", width = 480, height = 480)
    
    par(mfcol = c(2, 2))
    
    plot(time, 
         active_power, 
         xlab = "", 
         ylab = "Global Active Power", 
         type = "l")
    
    
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
           lty = c(1, 1),
           bty = "n")
    
    
    plot(time, 
         volt, 
         xlab = "datetime", 
         ylab = "Voltage", 
         type = "l")
  
    
    plot(time, 
         reactive_power, 
         xlab = "datetime", 
         ylab = "Global_reactive_power", 
         type ="l")
    
  dev.off()
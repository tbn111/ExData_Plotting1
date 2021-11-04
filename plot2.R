    file <- "household_power_consumption.txt"
    dataset <- read.table(file, sep = ";", header = T)

    dates <- dataset[dataset$Date %in% c("1/2/2007", "2/2/2007"), ]
    data <- as.numeric(dates$Global_active_power)
    
    time <- strptime(paste(dates$Date, dates$Time), "%d/%m/%Y %H:%M:%S")
    
    png("plot2.png", width = 480, height = 480)
    
    plot(time, 
         data,
         xlab = "", 
         ylab = "Global Active Power (kilowatts)", 
         type = "l")
    
    dev.off()
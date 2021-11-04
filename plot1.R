    file <- "household_power_consumption.txt"
    dataset <- read.table(file, sep = ";", header = T)
    
    dates <- dataset[dataset$Date %in% c("1/2/2007", "2/2/2007"), ]
    data <- as.numeric(dates$Global_active_power)
    
    png("plot1.png", width = 480, height = 480)
    
    hist(data, 
         col = "red", 
         xlab = "Global Active Power (kilowatts)", 
         main = "Global Active Power")
    
    dev.off()
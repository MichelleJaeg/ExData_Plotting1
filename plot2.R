load_data <- function() {
  consumption_data <- read.csv("household_power_consumption.txt", nrows=2075259, na.strings=c("?", ""), sep=";")
  consumption_data <- subset(consumption_data, Date == "1/2/2007" | Date == "2/2/2007")
  consumption_data$DateTime <- as.POSIXct(paste(consumption_data$Date, consumption_data$Time), format="%d/%m/%Y %H:%M:%S") 
  return(consumption_data)
}

make_plot <- function(data) {
  plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  file_2 <- png(filename = "plot2.png")
  dev.copy(file = file_2)
  dev.off()
  
}

make_plot(load_data())
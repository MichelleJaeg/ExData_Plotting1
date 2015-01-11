load_data <- function() {
  consumption_data <- read.csv("household_power_consumption.txt", nrows=2075259, na.strings=c("?", ""), sep=";")
  consumption_data <- subset(consumption_data, Date == "1/2/2007" | Date == "2/2/2007")
  consumption_data$DateTime <- as.POSIXct(paste(consumption_data$Date, consumption_data$Time), format="%d/%m/%Y %H:%M:%S") 
  return(consumption_data)
}

make_plots <- function(data) {
  file_4 <- png(filename = "plot4.png")
  split.screen(c(2, 2))
  screen(1)
  plot(data$DateTime, data$Global_active_power, type="l", xlab="", 
       ylab="Global Active Power (kilowatts)", cex.lab=0.6)
  screen(2)
  plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
  screen(3)
  plot(x = data$DateTime, y = data$Sub_metering_1, type="l", xlab="", 
       ylab="Energy sub metering", col = "black", ylim=c(0, 40), cex.lab=0.75)
  par(new=T) ## Make the next plot without cleaning the first
  plot(x = data$DateTime, y = data$Sub_metering_2, type="l", xlab="", ylab="", axes=F, col = "red",  ylim=c(0, 40))
  par(new=T)
  plot(x = data$DateTime, y = data$Sub_metering_3, type="l", xlab="", ylab="", axes=F, col = "blue",  ylim=c(0, 40))
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  lty=c(1, 1),
  lwd=c(1, 1, 1), col=c("black", "red", "blue"),
  cex=0.6)
  par(new=F)
  screen(4)
  plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime", 
       ylab="Global_reactive_power", cex.lab=0.75)
  dev.off()
  
}

make_plots(load_data())
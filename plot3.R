load_data <- function() {
  consumption_data <- read.csv("household_power_consumption.txt", nrows=2075259, na.strings=c("?", ""), sep=";")
  consumption_data <- subset(consumption_data, Date == "1/2/2007" | Date == "2/2/2007")
  consumption_data$DateTime <- as.POSIXct(paste(consumption_data$Date, consumption_data$Time), format="%d/%m/%Y %H:%M:%S") 
  return(consumption_data)
}

make_plot <- function(data) {
  file_3 <- png(filename = "plot3.png")
  plot(x = data$DateTime, y = data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col = "black",
       ylim=c(0, 40))
  par(new=T) ## Make the next plot without cleaning the first
  plot(x = data$DateTime, y = data$Sub_metering_2, type="l", xlab="", ylab="", axes=F, col = "red",  ylim=c(0, 40))
  par(new=T) ## Make the next plot without cleaning the first
  plot(x = data$DateTime, y = data$Sub_metering_3, type="l", xlab="", ylab="", axes=F, col = "blue",  ylim=c(0, 40))
  par(new=F)
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  lty=c(1, 1),
  lwd=c(1, 1, 1), col=c("black", "red", "blue"))
  dev.off()
  
}

make_plot(load_data())
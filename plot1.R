load_data <- function() {
  consumption_data <- read.csv("household_power_consumption.txt", nrows=2075259, na.strings=c("?", ""), sep=";")
  consumption_data <- subset(consumption_data, Date == "1/2/2007" | Date == "2/2/2007")
  library(lubridate)
  consumption_data$Date <- dmy(paste(consumption_data$Date))
  consumption_data$Time <- dmy_hms(paste(consumption_data$Date, consumption_data$Time))
  return(consumption_data)
}

make_plot <- function(data) {
    hist(data$Global_active_power, col = "red", main="Global Active Power", 
         xlab="Global Active Power (kilowatts)", ylab="Frequency")
    file_1 <- png(filename = "plot1.png")
    dev.copy(file = file_1)
    dev.off()
     
}

make_plot(load_data())
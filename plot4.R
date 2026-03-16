setwd("~/power_project")

data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

data$Datetime <- strptime(paste(data$Date, data$Time),
                          "%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

plot(data$Datetime,
     data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

plot(data$Datetime,
     data$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

plot(data$Datetime,
     data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(data$Datetime, data$Sub_metering_2, col = "red")
lines(data$Datetime, data$Sub_metering_3, col = "blue")

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1,
       bty = "n",
       cex = 0.8)

plot(data$Datetime,
     data$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()
setwd("~/power_project")

data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

data$Datetime <- strptime(paste(data$Date, data$Time),
                          "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)

plot(data$Datetime,
     data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()


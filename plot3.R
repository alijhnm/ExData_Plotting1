library(data.table)
library(lubridate)
library(dplyr)

data <- fread("household_power_consumption.txt") %>%
  filter(Date=="1/2/2007" | Date=="2/2/2007") %>%
  mutate(Date=dmy(Date)) %>%
  mutate(Date=ymd_hms(paste(Date, Time))) %>%
  mutate(Global_active_power=as.numeric(Global_active_power)) %>%
  mutate(Sub_metering_1=as.numeric(Sub_metering_1)) %>%
  mutate(Sub_metering_2=as.numeric(Sub_metering_2)) %>%
  mutate(Sub_metering_3=as.numeric(Sub_metering_3)) %>%
  select(Date, Global_active_power, Sub_metering_1, Sub_metering_2, Sub_metering_3)
plot(x = data$Date, y = data$Sub_metering_1, type="l", ylab="Global Active Power (kilowatts)", xlab="", main="Energy sub metering")
with(data, points(data$Date, data$Sub_metering_2, type = "l", col=("red")))
with(data, points(data$Date, data$Sub_metering_3, type = "l", col=("blue")))
legend("topright", col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2)
dev.copy(png, "plot3.png")
dev.off()
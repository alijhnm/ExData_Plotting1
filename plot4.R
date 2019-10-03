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
  mutate(Sub_metering_3=as.numeric(Sub_metering_3))

par(mfrow=c(2,2))

with(data, plot(Date, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
with(data, plot(Date, Voltage, type="l", xlab = "datetime", ylab="Voltage"))
with(data, plot(Date, data$Sub_metering_1, type="l", ylab = "Energy Sub Metering", xlab=""))
with(data, lines(Date, Sub_metering_2, type="l", col="red"))
with(data, lines(Date, Sub_metering_3, type="l", col="blue"))
with(data, plot(Date, Global_reactive_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.copy(png, "plot4.png")
dev.off()
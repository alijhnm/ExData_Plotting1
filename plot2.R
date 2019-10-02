library(data.table)
library(lubridate)
library(dplyr)

data <- fread("household_power_consumption.txt") %>%
  filter(Date=="1/2/2007" | Date=="2/2/2007") %>%
  mutate(Date=dmy(Date)) %>%
  mutate(Date=ymd_hms(paste(Date, Time))) %>%
  mutate(Global_active_power=as.numeric(Global_active_power)) %>%
  select(Date, Global_active_power)
plot(x = data$Date, y = data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, "plot2.png")
dev.off()
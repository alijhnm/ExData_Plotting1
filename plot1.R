library(data.table)
library(lubridate)
library(dplyr)

data <- fread("household_power_consumption.txt") %>%
  filter(Date=="1/2/2007" | Date=="2/2/2007") %>%
  mutate(Global_active_power=as.numeric(Global_active_power)) %>%
  select(Global_active_power)
hist(data$Global_active_power, col=("red"), main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, "plot1.png")
dev.off()
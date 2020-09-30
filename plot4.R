library(dplyr)
path <- "C:/Users/browm/Documents/CourseraGit/ExploratoryDataAnalysis/Week1/ExData_Plotting1/"

#read data
houseHold <- read.table(paste(path,"household_power_consumption.txt",sep = ""),header = TRUE, sep = ";")

#subset data
data <- filter(houseHold, Date %in% c("1/2/2007","2/2/2007"))

#unnamed-chunk-5 (plot4)
#get data to plot
dataPng4 <- data %>% mutate(dateTime = strptime(paste(Date, Time, sep = " "),"%d/%m/%Y %H:%M:%S"),
                            Global_active_power = as.numeric(Global_active_power),
                            Global_reactive_power = as.numeric(Global_reactive_power),
                            Voltage = as.numeric(Voltage),
                            Sub_metering_1 = as.numeric(Sub_metering_1),
                            Sub_metering_2 = as.numeric(Sub_metering_2),
                            Sub_metering_3 = as.numeric(Sub_metering_3)) %>%
  select(Global_active_power,Global_reactive_power,Voltage,Sub_metering_1 ,Sub_metering_2 ,Sub_metering_3  ,dateTime)

#plot  
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(dataPng4$dateTime,  dataPng4$Global_active_power, type="l", ylab="Global Active Power", xlab="")

plot(dataPng4$dateTime,  dataPng4$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dataPng4$dateTime,  dataPng4$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(dataPng4$dateTime,dataPng4$Sub_metering_2, type="l", col="red")
lines(dataPng4$dateTime,dataPng4$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty = "n")

plot(dataPng4$dateTime, dataPng4$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
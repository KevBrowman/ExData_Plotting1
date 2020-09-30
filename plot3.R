library(dplyr)
path <- "C:/Users/browm/Documents/CourseraGit/ExploratoryDataAnalysis/Week1/ExData_Plotting1/"

#read data
houseHold <- read.table(paste(path,"household_power_consumption.txt",sep = ""),header = TRUE, sep = ";")

#subset data
data <- filter(houseHold, Date %in% c("1/2/2007","2/2/2007"))

#unnamed-chunk-4 (plot3)
#get data to plot
dataPng3 <- data %>% mutate(dateTime = strptime(paste(Date, Time, sep = " "),"%d/%m/%Y %H:%M:%S"),
                            Sub_metering_1 = as.numeric(Sub_metering_1),
                            Sub_metering_2 = as.numeric(Sub_metering_2),
                            Sub_metering_3 = as.numeric(Sub_metering_3)) %>%
  select(Sub_metering_1 ,Sub_metering_2 ,Sub_metering_3  ,dateTime)

#plot  
png("plot3.png", width=480, height=480)
plot(dataPng3$dateTime,  dataPng3$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(dataPng3$dateTime,dataPng3$Sub_metering_2, type="l", col="red")
lines(dataPng3$dateTime,dataPng3$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
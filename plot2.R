library(dplyr)
path <- "C:/Users/browm/Documents/CourseraGit/ExploratoryDataAnalysis/Week1/ExData_Plotting1/"

#read data
houseHold <- read.table(paste(path,"household_power_consumption.txt",sep = ""),header = TRUE, sep = ";")

#subset data
data <- filter(houseHold, Date %in% c("1/2/2007","2/2/2007"))

#unnamed-chunk-3 (plot2)
#get data to plot
dataPng2 <- data %>% mutate(dateTime = strptime(paste(Date, Time, sep = " "),"%d/%m/%Y %H:%M:%S")) %>%
  select(Global_active_power, dateTime)

y <- as.numeric(unlist(select(dataPng2, Global_active_power)))
x <- select(dataPng2, dateTime)

#plot  
png("plot2.png", width=480, height=480)
plot(x, y, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

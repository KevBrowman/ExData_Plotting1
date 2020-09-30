library(dplyr)
path <- "C:/Users/browm/Documents/CourseraGit/ExploratoryDataAnalysis/Week1/ExData_Plotting1/"

#read data
houseHold <- read.table(paste(path,"household_power_consumption.txt",sep = ""),header = TRUE, sep = ";")

#subset data
data <- filter(houseHold, Date %in% c("1/2/2007","2/2/2007"))

#unnamed-chunk-2 (plot1)
#get data to plot
dataPng1 <- select(data,Global_active_power)
dataPngNum <- as.numeric(unlist(dataPng1))

#plot
png("plot1.png", width=480, height=480)
hist(dataPngNum, main="Global Active Power", col="red",xlab="Global Active Power (kilowatts)")
dev.off()
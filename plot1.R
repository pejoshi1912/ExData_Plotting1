library(lubridate)

#Read data starting from 1/2/2007 (row# 66638) and ending at 2/2/2007(row#69517)
ecdata <- read.table(file="household_power_consumption.txt",header = TRUE,
                     skip = 66637, nrows = (69517-66637), sep = ";",
                     colClasses = c("character","character",rep("numeric",7)),
                     col.names = c("Date","Time","GlAcPo","GlRePo","Vol","GlInt","SM1","SM2","SM3"),
                     stringsAsFactors = FALSE)


#convert Date and Time from character type to lubridate Date and Time 
ecdata$Date <- dmy(ecdata$Date)
ecdata$Time <- hms(ecdata$Time)


#create a png devide to draw and save the plots 
png(filename = "plot3.png", width = 480, height = 480)

#draw histogram
hist(ecdata$GlAcPo,col = "red",
     main="Global Active Power",
     xlab='Global_Active_Power (kilowatts)')

dev.off()

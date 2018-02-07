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

#draw plots
with(ecdata,{
  # get maximum of SM1, SM2 and SM3 to make sure that all the values can be covered within ylimit  
  ymax=max(SM1,SM2,SM3)
  
  plot(SM1, x=(Date+Time),type='l',ylim = c(0,ymax),ylab="", xlab = "")
  
  #set parameter new to true so that a new plot can be drawn 
  par(new=TRUE)
  plot(SM2,x=(Date+Time),type='l',col="red",ylim = c(0,ymax),ylab="", xlab = "")
  
  par(new=TRUE)
  plot(SM3,x=(Date+Time),type='l',col="blue",ylim = c(0,ymax),ylab="Energy sub metering", xlab = "")
  
  #place a legend at the topright position
  legend("topright",
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col = c("black","red", "blue"),
         lty = "solid")
})
dev.off()
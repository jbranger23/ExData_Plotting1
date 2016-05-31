## Reading data
setClass("fullDate")
setAs("character","fullDate",function(from) as.POSIXct(from))
cClasses<-c("fullDate",rep("numeric",7))
twoDaySubset<-read.table("data/twoDaySubset.csv",sep=";",header = TRUE,colClasses = cClasses)

## Ploting to display
hist(twoDaySubset$Global_active_power,xlab = "Global Active Power (kilowatts)",xlim = c(0,7), col="red", breaks = 12,main = "Global Active Power",axes = FALSE)
axis(1,at=c(0,2,4,6))
axis(2,at=seq(0,1200,200))

## Plotting to png file
## Opening a new PNG device
dev.set(4)
png("Plots/plot1.png",width = 480,height = 480)
hist(twoDaySubset$Global_active_power,xlab = "Global Active Power (kilowatts)",xlim = c(0,7), col="red", breaks = 12,main = "Global Active Power",axes = FALSE)
axis(1,at=c(0,2,4,6))
axis(2,at=seq(0,1200,200))

dev.off() ##  close the PNG device!
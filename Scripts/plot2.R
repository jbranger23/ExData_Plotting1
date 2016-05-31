## Reading data
setClass("fullDate")
setAs("character","fullDate",function(from) as.POSIXct(from))
cClasses<-c("fullDate",rep("numeric",7))
twoDaySubset<-read.table("data/twoDaySubset.csv",sep=";",header = TRUE,colClasses = cClasses)

## Ploting to display
with(twoDaySubset,plot(timeStamp,Global_active_power,type="l",ylab = "Global Active Power (kilowatts)",xlab = "",col="black"))


## Plotting to png file
## Opening a new PNG device
dev.set(4)
png("Plots/plot2.png",width = 480,height = 480)
with(twoDaySubset,plot(timeStamp,Global_active_power,type="l",ylab = "Global Active Power (kilowatts)",xlab = "",col="black"))

dev.off()
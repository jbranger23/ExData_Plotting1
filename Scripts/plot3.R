## Reading data
setClass("fullDate")
setAs("character","fullDate",function(from) as.POSIXct(from))
cClasses<-c("fullDate",rep("numeric",7))
twoDaySubset<-read.table("data/twoDaySubset.csv",sep=";",header = TRUE,colClasses = cClasses)


## Ploting to display
plot.new()
with(twoDaySubset,plot(timeStamp,Sub_metering_1,type="n",ylab = "Energy sub metering",xlab = ""))
with(twoDaySubset,lines(timeStamp,Sub_metering_1,type="l"),col="black")
par(col="red")
with(twoDaySubset,lines(timeStamp,Sub_metering_2,type="l"),col="red")
par(col="blue")
with(twoDaySubset,lines(timeStamp,Sub_metering_3,type="l"),col="blue")
par(col="black")
legend("topright",legend=c("Sub_metering_1            ","Sub_metering_2    ","Sub_metering_3    "),pch=19,col=c("black","red","blue"),cex = .8,xjust = 0,y.intersp = 1.5)

## Plotting to png file
## Opening a new PNG device
dev.set(4)
png("Plots/plot3.png",width = 480,height = 480)
with(twoDaySubset,plot(timeStamp,Sub_metering_1,type="n",ylab = "Energy sub metering",xlab = ""))
with(twoDaySubset,lines(timeStamp,Sub_metering_1,type="l"),col="black")
par(col="red")
with(twoDaySubset,lines(timeStamp,Sub_metering_2,type="l"),col="red")
par(col="blue")
with(twoDaySubset,lines(timeStamp,Sub_metering_3,type="l"),col="blue")
par(col="black")
legend("topright",legend=c("Sub_metering_1            ","Sub_metering_2    ","Sub_metering_3    "),pch=19,col=c("black","red","blue"),cex = .8,xjust = 0,y.intersp = 1.5)
dev.off()
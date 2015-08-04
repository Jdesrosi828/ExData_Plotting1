## Read in the dataset.
full_data <-read.csv("household_power_consumption.txt", header=T, sep=";", na.strings="?",
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char=" ", 
                     quote='\"')
full_data$Date<-as.Date(full_data$Date, format="%d/%m/%Y")

## Find the subset of the data
data <- subset(full_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(full_data)

##Convert the dates
datetime <- paste(as.Date(data$Date), data$Time)
data$datetime <- as.POSIXct(datetime) 

##Plot3 
with(data, { 
        plot(Sub_metering_1~Datetime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="") 
        lines(Sub_metering_2~Datetime,col='Red') 
        lines(Sub_metering_3~Datetime,col='Blue')
}) 
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,  
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 



##Save out the file in a height/width specifications
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off() 
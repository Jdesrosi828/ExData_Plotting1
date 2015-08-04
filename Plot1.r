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

##Plot1 - histogram
hist(data$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

##Save out the file in a height/width specifications
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off() 
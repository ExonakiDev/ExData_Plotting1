# Read table in
power<-read.table('household_power_consumption.txt', 
                  header = TRUE, sep=';')
# Convert date to r date obj
power$Date2<-as.Date(as.character(power$Date), "%d/%m/%Y")

# Create a sequence of the two required dates to filter out
DATE1<-as.Date("2007-02-01")
DATE2<-as.Date("2007-02-02")
dates<-seq(DATE1, DATE2, by="days")

# Subset out the two dates
power2<-subset(power, Date2 %in% dates)

# Create a new column with the both the date and time
power2$Datetime<-as.POSIXct(paste(power2$Date2, power2$Time), 
                            format="%Y-%m-%d %H:%M:%S")


# Convert Global_active_power to numeric
power2$Globalactivepower<-as.numeric(power2$Global_active_power)

# Plot line graph
plot(power2$Datetime, power2$Globalactivepower, 
     type = 'l', xlab='', 
     ylab='Global Active Power (kilowatts)')

# Send to png device
dev.copy(png, filename='plot2.png', 
         width=480, height=480, units ="px")

# Close device
dev.off()
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

# Plot intial graph
plot(power2$Datetime,power2$Sub_metering_1, 
     type = 'l', col='black', 
     xlab='', ylab='Energy sub metering')
# Add line for Sub_metering_2
lines(power2$Datetime,power2$Sub_metering_2, 
      type = 'l', col='red')
# Add line for Sub_metering_3
lines(power2$Datetime,power2$Sub_metering_3, 
      type = 'l', col='blue')

# Add legend to top right
legend("topright", 
       legend=c("Sub_metering_1", 
                "Sub_metering_2", 
                "Sub_metering_3"),
        col = c("black", "red", "blue"),
        lwd = 2
       )

# Copy to png device
dev.copy(png, filename="plot3.png", height = 480,
         width = 480)

# Close display device: png
dev.off()
# Convert Global_active_power to numeric
power2$Globalactivepower<-as.numeric(power2$Global_active_power)

# Plot hist
hist(power2$Globalactivepower, freq = TRUE, 
     col='red', xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", main = "Global Active Power")

# Copy to png file device
dev.copy(png, filename="plot1.png" )

# Close device
dev.off()
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
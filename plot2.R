# Plot line graph
plot(power2$Datetime, power2$Globalactivepower, 
     type = 'l', xlab='', 
     ylab='Global Active Power (kilowatts)')

# Send to png device
dev.copy(png, filename='plot2.png', 
         width=480, height=480, units ="px")

# Close device
dev.off()
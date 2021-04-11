power<-read.table('household_power_consumption.txt', header = TRUE, sep=';')
power$Date2<-as.Date(as.character(power$Date), "%d/%m/%Y")
DATE1<-as.Date("2007-02-01")
DATE2<-as.Date("2007-02-02")
dates<-seq(DATE1, DATE2, by="days")
power2<-subset(power, Date2 %in% dates)
power2$Datetime<-as.POSIXct(paste(power2$Date2, power2$Time), format="%Y-%m-%d %H:%M:%S")


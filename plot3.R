# Translating xlab into english
Sys.setlocale(locale = "C")

# Setting wd
setwd("C:/Documents1/R_directory/ED/exdata_data_household_power_consumption")

# Reading data
d <- read.table("household_power_consumption.txt", sep=";", 
                header = TRUE, na.strings = "?", nrows = 132462, 
                colClasses = c(rep("character", 2) , rep("numeric", 7)))

# Creating dateTime variable
dateTime <- paste(d$Date, d$Time) ## combined two colums
dateTime <- as.POSIXct(dateTime, format = '%d/%m/%Y %H:%M:%S') ## converted them to POSIXct
d <- cbind(d, dateTime) ## added them to dataset

# Changing ONLY Date variable format for subsetting
d$Date<- as.Date(d$Date, "%d/%m/%Y")

# Subsetting dataset
d_sub <- subset(d, Date >= "2007-02-01" & Date <= "2007-02-02")

# Creating PNG file
png(filename = "C:/Documents1/R_directory/ED/exdata_data_household_power_consumption/plot3.png", 
    height = 480, width = 480, bg = "white")

# Actual plotting

# Plot
plot(d_sub$dateTime, d_sub$Sub_metering_1, ylab = "Enegry sub metering", xlab = "", type = "l")
lines(d_sub$dateTime, d_sub$Sub_metering_2, type = "l", col = "red")
lines(d_sub$dateTime, d_sub$Sub_metering_3, type = "l", col = "blue")

# Legend
plot_colors <- c("black", "red", "blue")
legend("topright", names(d_sub[,7:9]), cex = 0.8, col = plot_colors, lty = 1)

# Turn off graphic device
dev.off()

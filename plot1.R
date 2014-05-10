# Setting wd
setwd("C:/Documents1/R_directory/ED/exdata_data_household_power_consumption")

# Reading data
d <- read.table("household_power_consumption.txt", sep=";", 
                header = TRUE, na.strings = "?", nrows = 132462, 
                colClasses = c(rep("character", 2) , rep("numeric", 7)))

# Changing date fomat
d$Date<- as.Date(d$Date, "%d/%m/%Y")

# Subsetting dataset
d_sub <- subset(d, Date >= "2007-02-01" & Date <= "2007-02-02")

# Creating PNG file
png(filename = "C:/Documents1/R_directory/ED/exdata_data_household_power_consumption/plot1.png", 
    height = 480, width = 480, bg = "white")

# Actual plotting
hist(d_sub$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
     col = "red", main = "Global Active Power")

# Turn off graphic device
dev.off()

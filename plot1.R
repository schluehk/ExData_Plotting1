## Function used to plot Graph 1 to plot1.png

plot1 <- function(df)
{
    df_epower <- subset(df, (Date == '1/2/2007') | (Date == '2/2/2007'));
    png("plot1.png", width=480, height=480)
    hist(as.numeric(df_epower$Global_active_power),
         ylab = "Frequency",
         xlab = "Global Active Power (kilowatts)",
         main = "Global Active Power",
         col = "red")
    dev.off()
}

## Load data and plot them
plot1(read.csv("household_power_consumption.txt", sep=";", colClasses = "character"))
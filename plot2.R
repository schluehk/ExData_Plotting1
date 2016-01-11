## Function used to plot Graph 2 to plot2.png

plot2 <- function(df)
{
    df_epower <- subset(df, (Date == '1/2/2007') | (Date == '2/2/2007'));
    png("plot2.png", width=480, height=480)
    y <- as.numeric(df_epower$Global_active_power)
    plot(y, type="l", 
         xlab="", 
         ylab="Global Active Power (kilowatts)",
         xaxt="n"
    )
    n <- nrow(df_epower);
    axis(side=1, labels=c("Thu", "Fr", "Sat"), at=c(0, n/2, n))
    box()
    dev.off()
}

## Load data and plot them
plot2(read.csv("household_power_consumption.txt", sep=";", colClasses = "character"))

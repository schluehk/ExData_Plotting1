## Function used to plot Graph 3 to plot3.png

plot3 <- function(df)
{
    df_epower <- subset(df, (Date == '1/2/2007') | (Date == '2/2/2007'));
    png("plot3.png", width=480, height=480)
    y <- as.numeric(df_epower$Sub_metering_1)
    plot(y, type="n", 
         xlab="", 
         ylab="Energy sub metering",
         xaxt="n"
    )
    n <- nrow(df_epower);
    axis(side=1, labels=c("Thu", "Fr", "Sat"), at=c(0, n/2, n))
    lines(as.numeric(df_epower$Sub_metering_1), bg="black")
    lines(as.numeric(df_epower$Sub_metering_2), col="red")
    lines(as.numeric(df_epower$Sub_metering_3), col="blue")
    legend("topright", 
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           cex=1, col=c("black", "red", "blue"), 
           lwd=2);
    box()
    dev.off()
}

## Load data and plot them
plot3(read.csv("household_power_consumption.txt", sep=";", colClasses = "character"))
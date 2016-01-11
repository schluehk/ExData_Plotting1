## Function used to plot Graph 4 to plot4.png

plot4 <- function(df)
{
    df_epower <- subset(df, (Date == '1/2/2007') | (Date == '2/2/2007'));
    n <- nrow(df_epower);
    
    png("plot4.png", width=480, height=480)
    
    old.par <- par(mfrow=c(2, 2))

    #####  Graph 1 
    y <- as.numeric(df_epower$Global_active_power)
    plot(y, type="l", 
         xlab="", 
         ylab="Global Active Power",
         xaxt="n"
    )
    axis(side=1, labels=c("Thu", "Fr", "Sat"), at=c(0, n/2, n))
    box()

    #####  Graph 3
    y <- as.numeric(df_epower$Voltage)
    plot(y, type="l", 
         xlab="", 
         ylab="Voltage",
         xaxt="n"
    )
    axis(side=1, labels=c("Thu", "Fr", "Sat"), at=c(0, n/2, n))
    mtext(side=1, text="datetime", line=2.5, cex = 0.8)
    box()
    
    #####  Graph 2
    y <- as.numeric(df_epower$Sub_metering_1)
    plot(y, type="n", 
         xlim=c(0,3000),
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
           cex=0.95, col=c("black", "red", "blue"), 
           lwd=2, bty="n");
    box()
    

    #####  Graph 4
    y <- as.numeric(df_epower$Global_reactive_power)
    plot(y, type="l", 
         xlab="", 
         ylab="Global_reactive_power",
         xaxt="n"
    )
    axis(side=1, labels=c("Thu", "Fr", "Sat"), at=c(0, n/2, n))
    mtext(side=1, text="datetime", line=2.5, cex = 0.8)
    box()
    par(old.par)
    
    dev.off()
}

## Load data and plot them
plot4(read.csv("household_power_consumption.txt", sep=";", colClasses = "character"))
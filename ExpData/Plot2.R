plot2 <- function(file){
    Sys.setlocale("LC_TIME", "C")
    n <- 1
    if(!file.exists(file)){
        print("Seems like there is no such file, R is going to download it (20 Mb) from the net. Proceed?")
        print("1: Yes :)")
        print("2: No :(")
        question <- function(){
            n <- readline(prompt = "Choose Your Destiny: ")
            if(n == 1){
                download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
                unzip("household_power_consumption.zip")            
            } else if(n == 2){
                print("Okay... :(((((")
                print("Script will be terminated in 3...")
                print("2...")
                print("1...")
            } else if(n != 1 | n != 2 | !is.numeric(n)){
                print("Sorry, unknown command. Please, try again :)")
                n <- question()
            }
            return(invisible(n))
        }
        n <- question()
    }
    if(n == 1){
        data <- read.table(file, sep = ";", na.strings = "?", header = TRUE, skip = 66636, nrows = 2880, colClasses = c("character", "character", rep("numeric", 6)))
        headers <- read.table(file, sep = ";", na.strings = "?", header = TRUE, nrows = 1)
        headers <- names(headers)
        names(data) <- headers
        dates <- data[, "Date"]
        times <- data[, "Time"]
        datetime <- paste(dates, times)
        datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
        data$Date <- NULL
        data$Time <- NULL
        data <- cbind(data, datetime)
        plot(data[, "Global_active_power"] ~ data[, "datetime"], type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)")
        png(filename = "plot2.png")
        plot(data[, "Global_active_power"] ~ data[, "datetime"], type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)")
        dev.off()
        print("The plot is now saved in the working directory")
    }    
}
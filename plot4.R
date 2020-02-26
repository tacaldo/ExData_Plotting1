#Notes: 
# - install packages needed; the sqldf package is needed to run this source
# - set working directory to the location of household_power_consumption.txt

#install.packages("sqldf");
#library("sqldf");

#Use correct path for your local environment
#setwd("C:/R_ProjectsWorkspace/ExploritoryDataAnalysisWk1Project/exdata_data_household_power_consumption");

png("plot4.png", width = 480, height = 480);

par(mfrow = c(2,2));


fileName <- "household_power_consumption.txt";
sqlQry = "select * from file where Date LIKE '1/2/2007' OR Date LIKE '2/2/2007'  ";

filteredData <- read.csv.sql(fileName,  header = TRUE, sep = ";", sql = sqlQry);
badData <- filteredData[!complete.cases(filteredData),];

cleanedData <- na.omit(filteredData);
cleanedData$DateTime <- strptime(paste(cleanedData$Date, cleanedData$Time), "%d/%m/%Y %H:%M:%S");

with(cleanedData, {

  #Global Active Power
  plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "");
  
  #Voltage
  plot(DateTime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime");
  
  #Energy sub metering
  plot(DateTime, Sub_metering_1,  type="l", ylab = "Energy sub metering", xlab = "", col="black");
  lines(DateTime, Sub_metering_2, type = "l", col = "red");
  lines(DateTime, Sub_metering_3, type = "l", col = "blue");
  
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty=1, lwd=2, bty = "n", col = c("black", "red", "blue"));
  
  #Global Reactive Power
  plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime");
  

})




dev.off()






















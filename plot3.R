#Notes: 
# - install packages needed; the sqldf package is needed to run this source
# - set working directory to the location of household_power_consumption.txt

#install.packages("sqldf");
#library("sqldf");

#Use correct path for your local environment
#setwd("C:/R_ProjectsWorkspace/ExploritoryDataAnalysisWk1Project/exdata_data_household_power_consumption");

png("plot3.png", width = 480, height = 480);

fileName <- "household_power_consumption.txt";
sqlQry = "select * from file where Date LIKE '1/2/2007' OR Date LIKE '2/2/2007'  ";

filteredData <- read.csv.sql(fileName,  header = TRUE, sep = ";", sql = sqlQry);
badData <- filteredData[!complete.cases(filteredData),];

cleanedData <- na.omit(filteredData);
cleanedData$DateTime <- strptime(paste(cleanedData$Date, cleanedData$Time), "%d/%m/%Y %H:%M:%S");

with(cleanedData, {

  plot(DateTime, Sub_metering_1,  type="l", ylab = "Energy sub metering", xlab = "", col="black");
  
  lines(DateTime, Sub_metering_2, type = "l", col = "red");
  
  lines(DateTime, Sub_metering_3, type = "l", col = "blue");
  

})


legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2, col = c("black", "red", "blue"));


dev.off()






















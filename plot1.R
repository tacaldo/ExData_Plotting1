#Notes: 
# - install packages needed; the sqldf package is needed to run this source
# - set working directory to the location of household_power_consumption.txt

#install.packages("sqldf");
#library("sqldf");

#Use correct path for your local environment
#setwd("C:/R_ProjectsWorkspace/ExploritoryDataAnalysisWk1Project/exdata_data_household_power_consumption");

png("plot1.png", width = 480, height = 480);

fileName <- "household_power_consumption.txt";
sqlQry = "select * from file where Date LIKE '1/2/2007' OR Date LIKE '2/2/2007'  ";

filteredData <- read.csv.sql(fileName,  header = TRUE, sep = ";", sql = sqlQry);
badData <- filteredData[!complete.cases(filteredData),];

cleanedData <- na.omit(filteredData);
cleanedData$DateTime <- strptime(paste(cleanedData$Date, cleanedData$Time), "%d/%m/%Y %H:%M:%S");

with(cleanedData, {
  hist(Global_active_power, 
       main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
  
})

dev.off()






















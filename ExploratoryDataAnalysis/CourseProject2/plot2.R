
# set the working directory to the directory where the data is present 
# the path in the following line is just an example, 
# uncomment replace with your own path
# setwd('E:/MOOCs/Coursera/Data Science - Specialization/Exploratory Data Analysis/Course Project 2')

# read in the two datasets
pmed <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

# subset out data for baltimore city
baltimorePMed <- pmed[pmed$fips == "24510",]

# get the total emissions for each year
totalpm <- aggregate(Emissions~year, baltimorePMed, sum)

# disabling scientific notation
options(scipen=999)

# plotting required graph
png(filename="plot2.png")
plot(totalpm$year,totalpm$Emissions,type='b', main = expression('Total '* PM[2.5] * ' emissions vs. Year in Baltimore City'),
     xlab="Year", ylab=expression('Total '* PM[2.5] * ' emission in tonnes'), col='steelblue', pch=22, lwd=2, cex=1, lty=5, bg='lightblue')
dev.off()

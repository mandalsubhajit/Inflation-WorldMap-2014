library(rworldmap)
setwd("D:\\Github\\Inflation WorldMap 2014")

inflationData <- read.csv("data.csv")
inflDF <- joinCountryData2Map( inflationData
                             ,joinCode = "ISO3"
                             ,nameJoinColumn = "Country.Code")

mapDevice(device = "png") #create world map shaped window
mapParams <- mapCountryData(inflDF
               ,nameColumnToPlot='Inflation'
               , addLegend='FALSE'
               , mapTitle = 'Inflation across Countries (2014)')
do.call( addMapLegend, c( mapParams
                          , legendLabels="all"
                          , legendWidth=0.5
))
dev.off()
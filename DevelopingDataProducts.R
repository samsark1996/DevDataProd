rm(list = ls(all.names = TRUE))
cat('\14')
set.seed(299792458)
library(data.table)
library(ggplot2)
library(corrplot)
library(DT)
library(leaflet)

covid_data = fread("D:\\1_Studies\\R and related subjects\\Coursera 1\\ProjectWork\\DevelopingDataProducts\\04-27-2021.csv")

covid_India = covid_data[Country_Region=="India"]
colnames(covid_India)[6:7] = c("latitude","longitude")
mxact = max(covid_India$Active)

covid_India %>%
  leaflet() %>%
  addTiles() %>%
  addCircles(weight = 1,radius = covid_India$Active/2)

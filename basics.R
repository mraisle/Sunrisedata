#let's just see what we can learn here

#install.packages("tmaptools")
#install.packages("ggplot2")
#install.packages("here")
#install.packages("dplyr")
#install.packages("plotly")


library(tmaptools)
library(ggplot2)
library(here)
library(dplyr)
library(plotly)

#ok let's import the data and try to sort it 

alldata <- read.csv(here("full_program_data_mass.csv"))


CAP <- filter(alldata, NEI_TYPE == "CAP")

HAP <- filter(alldata, NEI_TYPE == "HAP")
HAP1 <- HAP

other <- filter(alldata, NEI_TYPE == "")

GHG <- filter(other, UNIT_OF_MEASURE == "MTCO2e")

TRIandunlabeled <- filter(other, UNIT_OF_MEASURE == "Pounds")

##Let's now find how many of the 179 HAPs are in this dataset 

#list(HAP$POLLUTANT_NAME)

CountHAPS <- HAP1 %>%
  group_by(HAP1$POLLUTANT_NAME) %>%
  summarise(count=n())

#let's sort it from highest to lowest 


CountHAPS <- CountHAPS[order(-CountHAPS$count),]

write.csv(CountHAPS, here("HAPScount_mass.csv"))


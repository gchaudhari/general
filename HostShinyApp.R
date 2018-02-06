install.packages("ggplot2","dplyr") #add more packages 

#following may be required based on how the app is coded
#library(ggplot2)
#library ...

setwd('//Location of files containing APP.R')

library(shiny)
runApp(host="0.0.0.0",port=5050)

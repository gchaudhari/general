install.packages("ggplot2","dplyr")

setwd('//Location of files containing APP.R')

library(shiny)
runApp(host="0.0.0.0",port=5050)

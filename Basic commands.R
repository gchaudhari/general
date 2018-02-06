#General useful commands


#does not make numbers into scientific till 10 digits
("scipen" = 10) 

#to see enitre data in a column of a tibble
options(tibble.width = Inf) 

#note ' ' and also //
setwd('//Location of R Shiny Files') 

#comment uncomment
control + shift + C 


#read excel file, sheet into a data frame
DF<-read_excel("abc.xlsx", sheet = "Sheet1")


#while reading excel, fix date formats 
DF$Date<-format(DF$Date,'%m/%d/%Y')

#compare date numerically. Following keeps data which is greater than current date. Notice the Origin 
DF<-DF[as.numeric(as.Date(DF$Date,'%m/%d/%Y',origin= "1970-01-01")) > as.numeric(Sys.Date()),]

#creating a new data frame by specifying data type of columns of a Dataframe
DF_2<-data.frame(Date=character(),Week=numeric())
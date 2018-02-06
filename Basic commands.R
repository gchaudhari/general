#General useful commands

library(dplyr)
library(readxl)
library(lubridate)
library(xlsx)
library(ggplot2)

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

#write excel file 
write.xlsx(Final_data, paste("File_Name",".xlsx",sep = ""))


#while reading excel, fix date formats 
DF$Date<-format(DF$Date,'%m/%d/%Y')

#compare date numerically. Following keeps data which is greater than current date. Notice the Origin 
DF<-DF[as.numeric(as.Date(DF$Date,'%m/%d/%Y',origin= "1970-01-01")) > as.numeric(Sys.Date()),]

#creating a new data frame by specifying data type of columns of a Dataframe
DF_2<-data.frame(Date=character(),Week=numeric())

#append row to a data frame
newdf<- rbind()


#dplyr

#pipe function  %>% to get summary of data
DF <-DF %>%
  group_by(Week)%>%
  summarise(freq=n())

DF <- temp %>%
  anti_join(DF, by = "Week") %>%
  bind_rows(DF) %>%
  arrange(Week)

#mutate

DF_2<-mutate(df, new_column = ifelse(something == 00,TRUECASE,ifelse()) )

#cumulative sum syntax
cum_table<-mutate(df,Cum_total = cumsum(total))

#filter
DF2017<- filter(DF,Week<=53 & Week>= 38)


#extract week, day of the week
Date_Week = strftime(Date,format="%U")
Date_day = wday(as.Date(Date,'%m/%d/%Y'))


#scope of function 
Final_data<<-Final_data

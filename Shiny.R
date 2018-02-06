

#packages for R Shiny: safe to import all 

library(ggthemes)
library(scales)
library(shiny)
library(DT)
library(dplyr)
library(readxl)
library(lubridate)
library(xlsx)
library(ggplot2)
library(shinythemes)





#Shiny UI


ui <- fluidPage(theme = shinytheme("slate"), #change theme here 
                
                
                sidebarLayout(
                  
                  sidebarPanel(
                    
                    wellPanel(class="jumbotron",
                              tags$style(HTML(".js-irs-0 .irs-single, .js-irs-0 .irs-bar-edge, .js-irs-0 .irs-bar {background: darkslateblue}")),
                              
                              radioButtons("Region","Select Site",c("a","b","c","d"),"b"), #b is default selected
                              
                              sliderInput(inputId = "NumLines",label = "Select number of Lines",value = 4,min=1,max = 5),
                              
                              numericInput("UniqueID","Enter Value1",value=10), #10 is default value
                              
                              numericInput("HrsPerDay","Enter hours",10,1,24), #adding default, min and max value
                              
                              dateInput("StartDate","Select start date for forecasting",format(Sys.Date()+1,"%m/%d/%Y"))), #by default, selecting tomorrows date
                    
                    wellPanel(
                      class="jumbotron",
                      
                      radioButtons("ShowList","Show Holiday List",c("Yes","No"),"No"),
                      
                      helpText("gives additional instructions to users as to what to do"),
                      
                      dateInput("DateID","Select date",as.Date("01/05/2018",'%m/%d/%Y')), #by default 01 05 2018
                      
                      actionButton("ButtonID1","Description what button does")
                      
                    ),
                    
                    wellPanel(class="jumbotron",
                              
                              helpText("gives additional instructions to users as to what to do"),
                              
                              actionButton("ButtonId2","text on button", class = "btn btn-info"),
                              
                              
                              verbatimTextOutput('ID') #gives text output by creating a section 
                              
                    )
                    
                  )
                  ,
                  
                  
                  mainPanel(                           #this is the output section
                    class="jumbotron",
                    
                    conditionalPanel(        #show only if the following condition is satisfied
                      condition = "input.ShowList =='Yes'", 
                      DT::dataTableOutput('data')    #data is the reactive value
                    ),
                    
                    
                    helpText(" description "),
                    
                    verbatimTextOutput('ID'),
                    
                    
                    wellPanel(class="jumbotron",                            #show chart 1
                              plotOutput(outputId = "distPlot")
                    ),
                    
                    
                    wellPanel(class="jumbotron",                        #showing chart 2 
                              tags$style(HTML(".js-irs-0 .irs-single, .js-irs-0 .irs-bar-edge, .js-irs-0 .irs-bar {background: darkslateblue}")),
                              plotOutput(outputId = "distPlotPolar",width = "60%",height="480px",inline = FALSE)
                    )
                  )
                  
                )
)





server <- function(input, output) {
  
  #import data here. It will pull data from here whenever someone starts a Shiny session. So if input files are replaced after hosting a app, it would not matter
  
  Dynamic_Data_Raw<-read_excel("Excel.xlsx", sheet = "Sheet1")
  
  
  #this is a empty data frame created to store data from different functions   
  Final_data<-data.frame()  
  
  
  shinyInput <- function(FUN, len, id, ...) {
    inputs <- character(len)
    for (i in seq_len(len)) {
      inputs[i] <- as.character(FUN(paste0(id, i), ...))
    }
    inputs
  }
  
  
  df <- reactiveValues(data = data.frame(
    #column_name = ,
    #column_name2= aaaa
    #put all columns of df
  ))
  
  
  
  
  #output$data is the main data 
  
  output$data <- DT::renderDataTable(
    {dat<-datatable(df$data,style = "bootstrap",escape = FALSE,selection = 'none',options = list(aLengthMenu = c(10,40,100), iDisplayLength = 50, bSortClasses = TRUE
    ))
    
    return(dat)
    })
  
  
  
  
  observeEvent(input$select_button, {
    
    #modify df$data
    
  })
  
  
  
  #add date
  observeEvent(input$AddDate, {
    
    NewList<-rbind(df$data[1],format(as.Date(input$DateID, origin="1970-01-01"),'%m/%d/%Y')) #input$DateID is ID in UI
    
    df$data <- data.frame(
      
      #modification of df$data after adding something  
    )
    
    
  })
  
  
  
  
  
  
  #print table in verbatim
  observeEvent(input$FinalList, {
    
    #indicate user that finalize button needs to be pressed
    output$x3 <- renderPrint("whatever you want to display") 
    
    
    
    
    #defining Inputs
    LineNumber_Input = input$NumLines
    
    
    
    
    if (exists("dataframeName")) {
      
    } else 
    {
      
    }
    
    
    #LOGiC for Final_data
    
    
    
    if (exists("Final_data")) {
      
      #bar chart 
      output$distPlot <- renderPlot({
        
        ggplot(graph_data,
               aes(x=XColumn, y=YColumn)) +
          geom_bar(stat="identity", fill="darkslateblue")+
          
          # theme_hc(bgcolor = "darkunica") 
          theme(
            panel.background = element_rect(fill = "gray17",
                                            colour = "darkslateblue",
                                            size = 0.5, linetype = "solid"),
            plot.background = element_rect(fill = "gray21"
            ),
            panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                            colour = "gray27"),
            panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                            colour = "gray"),
            text = element_text(colour="White"),
            axis.text = element_text(colour="White"),
            legend.text = element_text(colour="Black")
          )
        
        
        
      })
      
      
      
      #Polar chart
      output$distPlotPolar <- renderPlot({
        
        ggplot(graph_data, aes(x=XColumn, y=YColumn, fill=YColumn)) +
          geom_histogram(binwidth=1, stat='identity') +
          scale_fill_gradient(low='white', high='red') + coord_polar()+
          theme(
            panel.background = element_rect(fill = "gray17",
                                            colour = "darkslateblue"),
            plot.background = element_rect(fill = "gray21"),
            panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                            colour = "gray27"),
            panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                            colour = "gray"),
            text = element_text(colour="White"),
            axis.text = element_text(colour="White"),
            legend.text = element_text(colour="White"),
            legend.background = element_rect(fill = "gray21",colour = "darkslateblue"),
            strip.background= element_rect(fill = "gray21")
            
          )
        
      })
      
      
      
      
      
    }
    
    
    ########  really important step to use data from various functions      
    Final_data<<-Final_data
    
  })
  
  
  
  
  observeEvent(input$ExportData, {
    
    if (nrow(Final_data)>0) { #making sure that we dont export null file
      Region_Input = input$Region
      
      write.xlsx(Final_data, paste(Region_Input,".xlsx",sep = ""))
      
      output$x3 <- renderPrint("File Exported")
      
    }
    
  })
  
  
}




shinyApp(ui = ui, server = server)

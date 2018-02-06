library(httr)

library(rjson)

library(gtools)

library(lubridate)

library(getPass)

library(plyr)

library(tcltk2)





#' Get a Ping token, which can be used to authenticate what needs to be done

#'

#' @param client_id: a client id pre-registered with the authentication server

#' @param client_secret: the client secret associated with the client_id

#' @param prod_environment: a boolean value that indicates whether to call the prod endpoint or not.

#'     Default to False, so the endpoint for non-prod will be used

#' @return the response from this call



get_token <- function(client_id, client_secret, prod_environment=TRUE){
  
  
  
  #get Token for authentication. Put authentication URL TEST 
  
  url <- "https://"
  
  
  
  #Authentication for PROD
  
  if (prod_environment) {
    
    url <- "https://"
    
  }
  
  
  
  payload <- list(
    
    grant_type = "client_credentials",
    
    client_id = client_id,
    
    client_secret = client_secret
    
  )
  
  
  
  req <- POST(url,
              
              add_headers(
                
                "Content-Type" = "application/x-www-form-urlencoded"
                
              ),
              
              body = payload,
              
              encode = "form"
              
  )
  
  return(req)
  
}





# get the data through the API



get_data <- function(ACC_token){
  
  
  
  # API URL  
  
  url <- "https://"
  
  
  
  # query is optional  
  
  query <- list(
    
    "type"=""
    
  )
  
  
  
  #actual call  
  
  req <- GET(url,
             
             add_headers(
               
               "Content-Type" = "application/json",
               
               "Authorization" = ACC_token
               
             ),
             
             query = query
             
  )
  
  return(req)
  
}





client_id <- ""

client_secret <- ""

response <- get_token(client_id, client_secret)

content <- content(response);content


final_data <- get_data(paste(content$token_type,content$access_token,sep=" "))
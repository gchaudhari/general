#API via WAM

library(httr)

library(rjson)

library(gtools)

library(lubridate)

library(getPass)

library(plyr)

library(tcltk2)


# get the data through API



get_data <- function(userName,wamcookie){
  
  
  
  ######### API Link
  
  url <- "https://"
  
  
  
  query <- list(
    
    "type"="field"
    
  )
  
  req <- GET(url,
             
             add_headers(
               
               "cm-remote-user" = userName,
               
               "Content-Type" = "application/json",
               
               "Cookie" = wamcookie
               
             ),
             
             query = query
             
  )
  
  return(req)
  
}


# get the cookie for user login

userName <- getPass(msg="User: ",forcemask = FALSE)

PassWd <- charToRaw(getPass(msg="Password: ",forcemask = TRUE))



#get wam  cookie (authentication url)

result<-GET('https://     ',authenticate(userName,rawToChar(PassWd), type='ntlm'))



ckielst <- unlist(result$headers['set-cookie'])

wamcookie <- strsplit(ckielst,";")[[1]][1]

print(wamcookie)

auth_sts <- result$status_code

rm(PassWd,result)



final_data <- get_data(userName,wamcookie)
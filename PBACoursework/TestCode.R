dataset<-read.csv("weatherAUS.csv")
library(mice)
library(lattice)
library(tidyr)
T_FillnaNumeric<-function(dataset){
  
  set.seed(123)
  temp_data <- mice(dataset,m=3,maxit=5,meth='pmm',seed=200)
  
  #print(densityplot(temp_data))
  NA_filled_Data <- complete(temp_data)
  print(typeof(temp_data))
  dataset <- dataset %>% mutate(NA_filled_Data)
  return(dataset)
}

data<-T_FillnaNumeric(dataset)
titanic_original <- read.csv("C:/Users/Rich Lindberg/Documents/R/titanic_original.csv", header = TRUE)
library(tidyr)
library(dplyr)
library(readr)
titanhandle <- read.csv("C:/Users/Rich Lindberg/Documents/R/titanic_original.csv",na.strings = c("","na"))
titanhandle1 <- titanhandle
titanhandle1$embarked <- lapply(titanhandle1$embarked, as.character)
titanhandle1$embarked[which(is.na(titanhandle1$embarked))] <- "S"
titanhandle2 <- titanhandle1
titanhandle2$age[which(is.na(titanhandle2$age))] <- mean(titanhandle2$age, na.rm = TRUE)
titanhanle3 <- titanhandle2
titanhanle3$cabin <- lapply(titanhanle3$cabin,as.character)
titanhanle3$has_cabin_number <- ifelse(titanhanle3$cabin == "NA", 0 , 1)
titanhandle4 <- titanhanle3
titanhandle4$has_cabin_number[which(is.na(titanhandle4$has_cabin_number))] <-0
titanic_cleans <- titanhandle4
titanic_cleans$cabin <- toString(titanic_cleans$cabin)
titanic_cleans$embarked <- toString(titanic_cleans$embarked)
write.csv(titanic_cleans, file = "titanic_clean.csv")





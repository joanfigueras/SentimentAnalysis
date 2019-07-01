if (!require("pacman")) install.packages("pacman")
pacman::p_load(dplyr, ggplot2,corrplot,plotly,ggfortify, textclean,
               GGally, readr,caret,tidyr,reshape,rstudioapi,kknn,randomForest,DescTools)

current_path <- getActiveDocumentContext()
setwd(dirname(dirname(current_path$path)))
rm(current_path)

factors <- read_csv("Datasets/factors1.csv")

nokia <- c("id",colnames(factors)[grepl(pattern = "nokia",colnames(factors))])
iphone <- c("id",colnames(factors)[grepl(pattern = "iphone",colnames(factors))])
samsung <- c("id",colnames(factors)[grepl(pattern = "samsung",colnames(factors))])
sony <- c("id",colnames(factors)[grepl(pattern = "sony",colnames(factors))])
htc <- c("id",colnames(factors)[grepl(pattern = "htc",colnames(factors))])
ios <- c("id",colnames(factors)[grepl(pattern = "ios",colnames(factors))])
google <- c("id",colnames(factors)[grepl(pattern = "google",colnames(factors))])



plot_ly(factors[nokia], x = ~id, 
            y = ~nokiacampos, name = 'Camerapositive', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~nokiacamneg, name = 'Cameranegative', mode = 'lines') %>%
  add_trace(y = ~nokiacamunc, name = 'Camerauncertain', mode = 'lines') %>%
  layout(title = paste("NOKIA"),
         xaxis = list(title = "ID"),
           yaxis = list (title = "Appearances"))

plot_ly(factors[iphone], x = ~id, 
        y = ~iphonecampos, name = 'Camerapositive', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~iphonecamneg, name = 'Cameranegative', mode = 'lines') %>%
  add_trace(y = ~iphonecamunc, name = 'Camerauncertain', mode = 'lines') %>%
  layout(title = paste("iphone"),
         xaxis = list(title = "ID"),
         yaxis = list (title = "Appearances"))


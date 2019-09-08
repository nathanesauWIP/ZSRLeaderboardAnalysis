# Date:         December 11, 2015
# Author:       Nathan Esau 
# Email:        nathanesau1@gmail.com
# Description:  Get leaderboards data from zeldaspeedruns.com for all points in time
#               (not just the snapshot at the current point in time). This requires
#               going through each game, the category of each game and finding the 
#               unique players who have submitted leaderboard times. Then, go to
#               the profile of each of these players, and get all their times.
#               These times have to be merged to the appropriate data.frame 
#               (grouped by game and category). After we have all of the times
#               for each game and category (at each point in time), we can look
#               at what the world record was at each point in time and who had the 
#               world record at that point. This is done in the "process_data.R" file
#               and plots are made in the "plots.R" file.

library(RCurl)
library(XML)

# BANDWIDTH warning: This code downloads thousands of HTML pages worth of data
# which causes it to use a lot of INTERNET BANDWIDTH
# running time: approx 30 minutes
# 
# also this technique may not work for LARGE DATASETS (>8gb) since R 
# stores the data frames in the ram. In this case, write data.frame to file,
# remove from memory and load and rewrite to file when needed

# TO UPDATE data after program is finished running, uncomment last line (save.image)
# This will save the data to "Data/category_data.Rdata"


rm(list=ls())
setwd("~/Documents/GitHub/ZSR_lb_data/")
load("Data/category_table.Rdata")
category_table$df <- paste0(category_table$Game_URL, "_", category_table$Category_URL)

categories_urls <- paste0("http://zeldaspeedruns.com/leaderboards/", category_table$Game_URL,
                          "/", category_table$Category_URL)

# create data frame for each category containing all the times ever recorded 
for(i in 1:nrow(category_table)) {
  assign(category_table$df[i], value=data.frame(Player=character(0), Time=character(0),
                                            Version=character(0), Date=character(0)))
}
rm(i)

# players <- character(0)
# # get all players on zsr leaderboards who have played 
# # any of these categories
# for(url in categories_urls) {
#   html <- getURL(url, followlocation = TRUE)
#   table <- readHTMLTable(html)[[1]]
#   players <- c(players, as.character(table$Player))
# }
# # remove duplicates for players who have played multiple categories
# players <- unique(players)
# players <- sort(players)
# players <- players[-c(which(players=="ã\u0081¾ã\u0083¼ã\u0081\u008aã\u0082\u008a(orima_r)"))]                                        
# players <- players[-c(which(players=="ã\u0081\u0090ã\u0081¤ã\u0081\u0090ã\u0081¤ã\u0081\u008dã\u0082\u008aã\u0081¼ã\u0081\u0097Radish"))]
# players <- players[-c(which(players==""))]
# 
# save(players, file="Data/players.Rdata")
load("Data/players.Rdata")

players_urls <- paste0("http://zeldaspeedruns.com/profiles/",players)
players_urls <- gsub(pattern = " ", replacement = "%20", players_urls)

category_table$Category <- factor(category_table$Category)
# bind all of each players times to these data frames
for(m in 1:length(players_urls)) {
  url <- players_urls[m]
  html <- getURL(url, followlocation=TRUE)
  doc <- htmlParse(html, asText=TRUE)
  games <- xpathSApply(doc, "//h3", xmlValue)
  tables <- readHTMLTable(html)
  
  if(length(tables)>0) {
  for(i in 1:length(tables)) {
    table <- tables[[i]]
    game <- games[i]
    categories <- as.character(unique(table$Category))
    for(j in 1:length(categories)) {
      category <- categories[j]
      table2 <- table[which(table$Category==category),]
      category_index <- which(category_table$Game == game & category_table$Category == category)
      if(length(category_index)==1) {
        df <- rbind(get(category_table$df[category_index]), data.frame(Player=players[m],
                                                                 Time=table2$Time,
                                                                 Version=table2$Version,
                                                                 Date=table2$Date))
        assign(category_table$df[category_index],df)
      }
    }
  }}
}
rm(table,table2,categories,url,doc,game,games,html,m,i,j,
   category_index, tables, category, df)
rm(categories_urls, players_urls, players)
rm(category_table)
# save.image(file="Data/category_data.Rdata")

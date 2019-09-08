rm(list=ls())
setwd("~/Documents/GitHub/ZSR_lb_data/")
load("~/Documents/GitHub/ZSR_lb_data/Data/category_data.Rdata")

library(BBmisc) # for sorting
library(plotly) # for interactive plots

plot_names <- ls()

get_wr <- function(df, wr_threshold=20) {
  df$Date <- as.Date(df$Date, format="%m/%d/%Y")
  df$Time <- as.character(df$Time)
  hms <- lapply(strsplit(df$Time, split=":"), as.numeric)
  df$min <- unlist(lapply(hms,function(x)x[1]*60+x[2]+x[3]/60))
  
  # Player Time Version Date
  # assume for now that last row is initial wr at that date
  # this means that the early time series won't be necessarily reliable 
  df <- sortByCol(df, c("Date"), asc = c(TRUE))
  df$WR <- 0
  df$WR[1] <- 1
  wr <- df$min[1]
  
  if(length(df$min)>1) {
  for(i in 2:length(df$min)) {
    if(df$min[i] <= wr) {
      df$WR[i] <- 1
      wr <- df$min[i]
    }
  }}
  
  # only times which were WR
  df_wr <- unique(df[which(df$WR==1),1:5])
  # remove initial rows which probably weren't wr
  legit_wr <- FALSE
  i <- 1
  while(legit_wr == FALSE && i < nrow(df_wr)) {
    if( (df_wr$min[i] - df_wr$min[i+1]) > 20) { # 20 min threshold
      df_wr <- df_wr[-i,]
    } else {
      legit_wr == TRUE
    }
    i <- i + 1
  }
  df_wr
}

plot_wr <- function(df, wr_threshold=20, title=NA) {
  wr <- get_wr(df, wr_threshold = wr_threshold)
  names(wr) <- c("Player", "Time", "Version", "Date", "Minutes")
  labels <- paste0(wr$Player, " (", wr$Version, ")")
  p <- plot_ly(wr, x=Date, y=Minutes, 
               text=labels, mode="lines+markers")
  if(!is.na(title)) {
    p <- layout(p, title=title)
  }
  show(p)
}

plot_wr(oot_any, title="Ocarina of Time (any%)")
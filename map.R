install.packages('leaflet')

library(tidyverse) #  data manipulation and graphs
library(leaflet) # maps

yelp_academic_dataset_business_restaurants <- read.csv("~/Yelp/yelp_academic_dataset_business_restaurants.csv")
business<-yelp_academic_dataset_business_restaurants


charlotteCoords = business %>% filter(city == "Charlotte")

center_lon = median(charlotteCoords$longitude,na.rm = TRUE)
center_lat = median(charlotteCoords$latitude,na.rm = TRUE)

leaflet(charlotteCoords) %>% addProviderTiles("Esri.NatGeoWorldMap") %>%
  addCircles(lng = ~longitude, lat = ~latitude,radius = ~sqrt(review_count))  %>%
  
  # controls
  setView(lng=center_lon, lat=center_lat,zoom = 13)

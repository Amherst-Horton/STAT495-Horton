require(mosaic)
flights <- read.csv("2014-01.csv")
names(flights)
flights <- flights %>%
  rename(day = dayofmonth, flight = flightnum, 
    air_time = airtime) %>%
  select(year, month, day, dep_time, arr_time, arr_delay, carrier, tailnum, flight,
   origin, dest, air_time, distance, cancelled, diverted)
write.csv(flights, file="2014-01-fixed.csv")

library(latticeExtra)
library(dplyr)
library(xts)
library(tidyr)
library(RColorBrewer)

df <- read.csv("Carbon_(CO2)_Emissions_by_Country.csv")



df_time_series <- df %>% 
  mutate(Date = as.Date(Date, format = "%d-%m-%Y")) %>% 
  select(Date, Region, Kilotons.of.Co2) %>% 
  pivot_wider(
    names_from = Region,
    values_from = Kilotons.of.Co2,
    values_fn = sum
  ) %>% arrange(Date)

ts_data <- xts(
  df_time_series[, c("Asia","Europe", "Africa", "Americas", 
                     "Oceania" )],
               order.by = df_time_series$Date)

hp <- horizonplot(ts_data,
            colorkey = TRUE,
            col.regions = rev(brewer.pal(11, "RdBu")),
            origin = 2000000,
            main="Kilotons of Co2")


png("Horizontal_Chart.png", width = 1000, height = 1000)
print(hp)
dev.off()
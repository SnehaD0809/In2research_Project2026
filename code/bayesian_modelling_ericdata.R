#1. Install and load packages

install.packages("brms")
install.packages("tidyverse")
install.packages("bayesplot")
install.packages("loo")

#2. Load the packages
library(brms)
library(tidyverse)
library(bayesplot)
library(loo)

#3. Load your data
df <- read.csv("/Users/sneha/Documents/In2research_Project2026/Data Cleaning/New Files/ERIC_bayesian_ready.csv")

#4.Checking the dataset
head(df)

dim(df)

str(df)

# Checking missing values (should be no missing values)
colSums(is.na(df))

#5. Covert to categorical varibales for the model
df$site_type <- as.factor(df$site_type)

df$year <- as.factor(df$year)

# Checking if the conversion worked
str(df$site_type)

str(df$year)

#6. creating log for backlog cost for even distribution
df$log_backlog_cost <- log1p(df$total_backlog_cost_gbp)

summary(df$log_backlog_cost)


#7. Scale continuous variables
df$age_score_scaled <- scale(df$age_vulnerability_score)

#floor area
df$floor_area_scaled <- scale(
  df$gross_internal_floor_area_m2
)

# heated volume
df$volume_scaled <- scale(
  df$site_heated_volume_m3
)

#non-functional floor area
df$nfs_floor_area_scaled <- scale(
  df$not_functionally_suitable_occupied_floor_area_pct
)

#gas consumption
df$gas_scaled <- scale(
  df$gas_consumed_kwh
)

# water volume
df$water_scaled <- scale(
  df$water_volume_including_borehole_m3
)

# steam consumed
df$steam_scaled <- scale(
  df$steam_consumed_kwh
)

# hot water consumed
df$hot_water_scaled <- scale(
  df$hot_water_consumed_kwh
)

# LED coverage
df$led_lighting_scaled <- scale(
  df$led_lighting_coverage_pct
)

# oil led heating 
df$oil_heating_scaled <- scale(
  df$oil_led_heating_sources_no
)

# flood occurrences
df$flood_scaled <- scale(
  df$flood_occurrences_triggering_a_risk_assessment_no
)

# overheating occurrences
df$overheating_scaled <- scale(
  df$overheating_occurrences_triggering_a_risk_assessment_no
)

# Convert missing indicators to numeric
missing_vars <- c(
  
  "not_functionally_suitable_occupied_floor_area_pct_missing",
  "gas_consumed_kwh_missing",
  "water_volume_including_borehole_m3_missing",
  "steam_consumed_kwh_missing",
  "hot_water_consumed_kwh_missing",
  "led_lighting_coverage_pct_missing",
  "oil_led_heating_sources_no_missing",
  "overheating_occurrences_triggering_a_risk_assessment_no_missing",
  "gross_internal_floor_area_m2_missing",
  "site_heated_volume_m3_missing"
  
)


#####

model_final <- brm(
  
  log_backlog_cost ~
    
    # Estate characteristics
    age_score_scaled +
    floor_area_scaled +
    nfs_floor_area_scaled +
    
    # Operational variables
    gas_scaled +
    water_scaled +
    led_lighting_scaled +
    steam_scaled +
    hot_water_scaled +
    oil_heating_scaled +
    
    
    # Climate variables
    flood_scaled +
    overheating_scaled +
    
    # Missing indicators
    gas_consumed_kwh_missing +
    water_volume_including_borehole_m3_missing +
    overheating_occurrences_triggering_a_risk_assessment_no_missing +
    
    # Categorical variables
    site_type +
    year,
  
  data = df,
  family = gaussian(),
  
  chains = 4,
  cores = 4,
  iter = 2000,
  
  seed = 42
)

summary(model_full)

# Running the full Bayesian model
model_no_missing <- brm(
  
  log_backlog_cost ~
    
    age_score_scaled +
    floor_area_scaled +
    nfs_floor_area_scaled +
    
    gas_scaled +
    water_scaled +
    led_lighting_scaled +
    
    flood_scaled +
    overheating_scaled +
    
    site_type +
    year,
  
  data = df,
  
  family = gaussian(),
  
  chains = 4,
  cores = 4,
  iter = 2000,
  
  seed = 42
)

summary(model_no_missing)

pp_check(model_no_missing)


library(bayesplot)

mcmc_plot(
  model_no_missing,
  type = "intervals"
)





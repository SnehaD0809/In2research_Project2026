# In2research_Project2026

# Project overview
This project investigates the vulnerability of NHS estate infrastructure to climate extremes across England, using data from the NHS Estates Returns Information Collection (ERIC).

Specifically whether characteristics of NHS estate sites, such as building age and size, alongside climate-related factors such as flooding and overheating, can help explain and predict backlog maintenance costs.

The project compares machine learning and Bayesian modelling approaches to identify important predictors and quantify uncertainty around estimated effects.

# My Objectives

The main objectives of the project are to:

- Clean and prepare the ERIC dataset for analysis.
- Investigate the distribution and variation of NHS backlog maintenance costs.
- Examine the relationship between estate characteristics, climate-related exposure and backlog costs.
- Develop machine learning models to predict backlog maintenance costs.
- Compare Random Forest and XGBoost model performance.
- Investigate whether transforming the highly skewed backlog cost variable improves predictive performance.
- Develop Bayesian regression models using brms to estimate associations between explanatory variables and backlog costs.
- Compare the findings from machine learning and Bayesian approaches.
- Explore the geographic variation of climate-related exposure across NHS sites in England.

# Data

The primary dataset is the NHS Estates Returns Information Collection (ERIC), covering NHS estate sites in England across the reporting years 2021/22 to 2024/25.

# Machine Learning

Random Forest
A Random Forest regression model was developed to predict total backlog maintenance costs using estate and climate-related variables.

XGBoost
An XGBoost regression model was developed using the same general modelling framework.

Model performance was assessed using:
- Mean Absolute Error (MAE)
- Root Mean Squared Error (RMSE)
- R²

Feature importance was also examined to identify variables contributing most strongly to the model's predictions.

# Bayesian modelling

Bayesian regression modelling was performed in R using the brms package.

The Bayesian approach was used to estimate the effects of estate and climate-related variables while explicitly quantifying uncertainty around the estimates.

Model assessment included:

Posterior estimates
95% credible intervals
Rhat convergence diagnostics

# Software and packages

The machine learning and exploratory analysis were performed using Python.

Key packages:

- pandas
- numpy
- matplotlib
- seaborn
- scikit-learn
- xgboost
- plotly
- folium
- pgeocode


Bayesian modelling packages:

- brms
- tidyverse
- bayesplot
- posterior
- tidybayes

# Author

Sneha D.

MSc Bioinformatics / In2Research Placement Project

2026
